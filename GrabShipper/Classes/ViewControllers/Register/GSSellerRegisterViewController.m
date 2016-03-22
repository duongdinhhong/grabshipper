//
//  GSSellerRegisterViewController.m
//  GrabShipper
//
//  Created by Dinh Hong Duong on 3/1/16.
//  Copyright © 2016 DInh Hong Duong. All rights reserved.
//

#import "GSSellerRegisterViewController.h"
#import "Backendless.h"
#import "GSUser.h"
#import "GSLoginViewController.h"
#import "SCLAlertView.h"
#import "Validation.h"
#import "GSAlertView.h"

@interface GSSellerRegisterViewController ()

@end

@implementation GSSellerRegisterViewController {
    NSInteger numberKeyboard;
    SCLAlertView *alert;
}

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initComponents];
    
    //Add gesture to dismiss keyboard
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:gesture];
    
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Init
- (void)initComponents {
    alert = [[SCLAlertView alloc] init];
    self.automaticallyAdjustsScrollViewInsets = NO;
    numberKeyboard = 0;
}

#pragma mark - dismissKeyboard
- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

#pragma mark - Show Alert
- (void)showErrorAlert:(NSString *)error {
    GSAlertView *alertView = [[[NSBundle mainBundle] loadNibNamed:@"GSAlertView" owner:self options:nil] objectAtIndex:0];
    alertView.frame = self.view.frame;
    alertView.errorLabel.text = error;
    [self.view addSubview:alertView];
}

#pragma mark - Keyboard Show and Hide Handle Actions
- (void)keyboardWillShow:(NSNotification *)notification {
    numberKeyboard ++;
    if (numberKeyboard == 1) {
        NSDictionary* info = [notification userInfo];
        CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
        CGPoint offset = self.scrollView.contentOffset;
        offset.y += kbSize.height/2;
        self.scrollView.contentOffset = offset;
    }
}

- (void)keyboardWillHide:(NSNotification *)notification {
    NSDictionary* info = [notification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    CGPoint offset = self.scrollView.contentOffset;
    offset.y -= kbSize.height/2;
    self.scrollView.contentOffset = offset;
    numberKeyboard = 0;
}

#pragma mark - Validation
/* Error codes:
 1: Null values
 2: Wrong Email format
 3: Confirm password not match
 4: Phone number not valid
 5: No network connection
 6: Username exists
 */
- (NSInteger)validateValues {
    
    NSInteger errorCode = 0;
    NSString *username = self.userNameTextField.text;
    NSString *email = self.emailTextField.text;
    NSString *password = self.passwordTextField.text;
    NSString *confirmPassword = self.confirmPasswordTextField.text;
    NSString *phoneNumber = self.phoneNumberTextField.text;
    
    if ([Validation validateStringNull:username] || [Validation validateStringNull:email] || [Validation validateStringNull:password] || [Validation validateStringNull:confirmPassword] || [Validation validateStringNull:phoneNumber]){
        errorCode = 1;
    } else if (![Validation checkNetworkConnection]) {
        errorCode = 5;
    } else if (![Validation validateUsername:username]) {
        errorCode = 6;
    } else if (![Validation validateEmail:email]) {
        errorCode = 2;
    } else if (![Validation validatePassword:password isEqualConfirmPassword:confirmPassword]) {
        errorCode = 3;
    } else if (![Validation validatePhoneNumber:phoneNumber]) {
        errorCode = 4;
    }
    return errorCode;
}

#pragma mark - Actions
- (IBAction)backButtonClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/* Error codes:
 1: Null values
 2: Wrong Email format
 3: Confirm password not match
 4: Phone number not valid
 5: No network connection
 6: Username already exists
 */
- (IBAction)signUp:(id)sender {
    NSInteger errorCode = [self validateValues];
    NSString *error = @"";
    if (errorCode == 0) {
        BackendlessUser *user = [BackendlessUser new];
        user.email = self.emailTextField.text;
        user.password = self.passwordTextField.text;
        Responder *responder = [Responder responder:self
                                 selResponseHandler:@selector(responseHandler:)
                                    selErrorHandler:@selector(errorHandler:)];
        [backendless.userService registering:user responder:responder];
    } else if (errorCode == 1) {
        error = @"Please fullfill all the information !";
    } else if (errorCode == 2) {
        error = @"Wrong email format !";
    } else if (errorCode == 3) {
        error = @"Confirm password does not match !";
    } else if (errorCode == 4) {
        error = @"Phone number is invalid";
    } else if (errorCode == 5) {
        error = @"No network connection !";
    } else if (errorCode == 6) {
        error = @"This username has already been taken !";
    }
    if (![error isEqualToString:@""]) {
        [self showErrorAlert:error];
    }
}

#pragma mark - Handle Errors And Responses Sign up
- (void)responseHandler:(id)response {
    BackendlessUser *user = (BackendlessUser *)response;
    NSLog(@"Successfully registered user = %@", user);
    //Add new data to GSUser table after successfully signed up
        Responder *responder = [Responder responder:self
                                 selResponseHandler:@selector(addNewGSUserHandler:)
                                    selErrorHandler:@selector(errorHandlerNewGSUser:)];
        GSUser *newUser = [[GSUser alloc] init];
        newUser.username = self.userNameTextField.text;
        newUser.email = self.emailTextField.text;
        newUser.password = self.passwordTextField.text;
        newUser.phoneNumber = self.phoneNumberTextField.text;
        newUser.type = self.type;
        id<IDataStore> dataStore = [backendless.persistenceService of:[GSUser class]];
        [dataStore save:newUser responder:responder];
}

- (void)errorHandler:(Fault *)fault {
    NSLog(@"Error code: %@ and message: %@", fault.faultCode,fault.message);
    //Error code: 3040: wrong email format, -1009: no network connection, 3033 : User with the same identity already exists
    //3041 : A value for a required property is missing password
    //3013 Missing value for the identity property email
    if ([fault.faultCode isEqualToString:@"3033"]) {
        [self showErrorAlert:@"This email has already signed up. Please choose another email to sign up !"];
    }
}

#pragma mark - Handle Responses And Errors Adding New GSUser
- (void)addNewGSUserHandler:(id)response {
    NSLog(@"Added a new user to GSUser table !");
}

- (void)errorHandlerNewGSUser:(Fault *)fault {
   NSLog(@"Error code: %@ and message: %@", fault.faultCode,fault.message);
}

@end
