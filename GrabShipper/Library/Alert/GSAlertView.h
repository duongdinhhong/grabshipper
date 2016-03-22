//
//  GSAlertView.h
//  GrabShipper
//
//  Created by Dinh Hong Duong on 3/5/16.
//  Copyright (c) 2016 DInh Hong Duong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSAlertView : UIView

@property (weak, nonatomic) IBOutlet UIView *alertView;

@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

- (IBAction)close:(id)sender;


@end
