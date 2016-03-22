//
//  GSAlertView.m
//  GrabShipper
//
//  Created by Dinh Hong Duong on 3/5/16.
//  Copyright (c) 2016 DInh Hong Duong. All rights reserved.
//

#import "GSAlertView.h"

@implementation GSAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews {
    [super layoutSubviews];
    self.alertView.layer.cornerRadius = 6;
    [self setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.8]];
}

- (IBAction)close:(id)sender {
    [self removeFromSuperview];
}
@end
