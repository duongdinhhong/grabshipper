//
//  GSHomeViewController.m
//  GrabShipper
//
//  Created by Dinh Hong Duong on 3/2/16.
//  Copyright © 2016 DInh Hong Duong. All rights reserved.
//

#import "GSHomeViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface GSHomeViewController ()

@end

@implementation GSHomeViewController {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //Check location service
    if([CLLocationManager locationServicesEnabled]){
        NSLog(@"Location Services Enabled");
        if([CLLocationManager authorizationStatus]==kCLAuthorizationStatusDenied){
         UIAlertView   *alert = [[UIAlertView alloc] initWithTitle:@"App Permission Denied"
                                               message:@"To re-enable, please go to Settings and turn on Location Service for this app."
                                              delegate:nil
                                     cancelButtonTitle:@"OK"
                                     otherButtonTitles:nil];
            [alert show];
        }
    } else {
        NSLog(@"Location Services Not Enabled !");
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
