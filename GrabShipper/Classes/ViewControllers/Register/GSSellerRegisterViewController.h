//
//  GSSellerRegisterViewController.h
//  GrabShipper
//
//  Created by Dinh Hong Duong on 3/1/16.
//  Copyright © 2016 DInh Hong Duong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSSellerRegisterViewController : UIViewController

@property NSInteger type;

#pragma mark - Outlets
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;

#pragma mark - Actions
- (IBAction)signUp:(id)sender;

- (IBAction)backButtonClicked:(id)sender;

@end
