//
//  GSLoginViewController.h
//  GrabShipper
//
//  Created by Dinh Hong Duong on 2/24/16.
//  Copyright © 2016 DInh Hong Duong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSLoginViewController : UIViewController

//@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)login:(id)sender;

- (IBAction)signup:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@end
