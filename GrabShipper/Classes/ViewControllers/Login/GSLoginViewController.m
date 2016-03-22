//
//  GSLoginViewController.m
//  GrabShipper
//
//  Created by Dinh Hong Duong on 2/24/16.
//  Copyright © 2016 DInh Hong Duong. All rights reserved.
//

#import "GSLoginViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "Backendless.h"
#import "GSHomeViewController.h"
#import "GSSellerRegisterViewController.h"
#import "Defined.h"
#import "Validation.h"
#import "SCLAlertView.h"

@interface GSLoginViewController ()

@end

@implementation GSLoginViewController {
    NSInteger numberKeyboard;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Add gesture to dismiss keyboard
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
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
    
    //
    self.automaticallyAdjustsScrollViewInsets = NO;
    numberKeyboard = 0;
}

- (void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)keyboardWillShow:(NSNotification *)notification {
    numberKeyboard ++;
    if (numberKeyboard == 1) {
        NSDictionary* info = [notification userInfo];
        CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
        CGPoint offset = self.scrollView.contentOffset;
        offset.y += kbSize.height/3;
        self.scrollView.contentOffset = offset;
    }
    
}

- (void)keyboardWillHide:(NSNotification *)notification {
        NSDictionary* info = [notification userInfo];
        CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
        CGPoint offset = self.scrollView.contentOffset;
        offset.y -= kbSize.height/3;
        self.scrollView.contentOffset = offset;
        numberKeyboard = 0;
}

- (void)tap {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (void)loginFacebook:(id)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    login.loginBehavior = FBSDKLoginBehaviorNative;
    [login logInWithReadPermissions:nil fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error)
     {
         if (error)
         {
             // Process error
         }
         else if (result.isCancelled)
         {
             // Handle cancellations
         }
         else
         {
             if ([result.grantedPermissions containsObject:@"email"])
             {
                 NSLog(@"result is:%@",result);
                 [self fetchUserInfo];
             }
         }
     }];
}

- (void)fetchUserInfo
{
    if ([FBSDKAccessToken currentAccessToken])
    {
        NSLog(@"Token is available : %@",[[FBSDKAccessToken currentAccessToken]tokenString]);
        
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"id, name, link, first_name, last_name, picture.type(large), email, birthday, bio ,location , friends ,hometown , friendlists"}]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error)
             {
                 NSLog(@"resultis:%@",result);
                 
                 
             }
             else
             {
                 NSLog(@"Error %@",error);
             }
         }];
    }
}
*/

- (IBAction)login:(id)sender {
    Responder *responder = [Responder responder:self
                             selResponseHandler:@selector(responseHandler:)
                                selErrorHandler:@selector(errorHandler:)];
    NSString *email = self.emailTextField.text;
    NSString *password = self.passwordTextField.text;
    [backendless.userService login:email password:password responder:responder];
}

- (IBAction)signup:(id)sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:@"What type of account you want to register ?"
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *button1 = [UIAlertAction actionWithTitle:@"Seller" style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction * action) {
                                                        //code to run once button is pressed
                                                        GSSellerRegisterViewController *sellerRegisterVC = [[GSSellerRegisterViewController alloc] init];
                                                        sellerRegisterVC.type = 2;
                                                        [self.navigationController pushViewController:sellerRegisterVC animated:YES];
                                                    }];
    UIAlertAction *button2 = [UIAlertAction actionWithTitle:@"Shipper" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //code to run once button is pressed
        GSSellerRegisterViewController *registerVC = [[GSSellerRegisterViewController alloc] init];
        registerVC.type = 1;
        [self.navigationController pushViewController:registerVC animated:YES];
    }];
    
    UIAlertAction *button3 = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        //code to run once button is pressed
    }];
    
    [alert addAction:button1];
    [alert addAction:button2];
    [alert addAction:button3];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)responseHandler:(id)response {
        BackendlessUser *user = (BackendlessUser *)response;
        NSLog(@"user = %@", user);
    GSHomeViewController *homeVC = [[GSHomeViewController alloc] init];
    [self.navigationController pushViewController:homeVC animated:YES];
}
              
- (void)errorHandler:(Fault *)fault {
    NSLog(@"Error code: %@ and message: %@", fault.faultCode,fault.message);
    NSString *error;
    //Error code: 3102: null string, -1009: no network connection, 3003: invalid information
    if ([fault.faultCode isEqualToString:@"3102"]) {
        error = @"Please fullfill the information";
    } else if ([fault.faultCode isEqualToString:@"-1009"]) {
        error = @"No network connection !";
    } else {
        error = @"Invalid login information !";
    }
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    [alert showError:self title:@"Error" subTitle:error closeButtonTitle:@"Close" duration:0.0f];
}

@end
