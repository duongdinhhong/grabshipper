//
//  GSSearchViewController.m
//  GrabShipper
//
//  Created by Dinh Hong Duong on 2/25/16.
//  Copyright © 2016 DInh Hong Duong. All rights reserved.
//

#import "GSSearchViewController.h"
#import "GSUser.h"
#import "Backendless.h"

@interface GSSearchViewController ()

@end

@implementation GSSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self saveNewUser];
}

- (void)saveNewUser{
    Responder *responder = [Responder responder:self
                             selResponseHandler:@selector(responseHandler:)
                                selErrorHandler:@selector(errorHandler:)];
    GSUser *user = [[GSUser alloc] init];
    user.username = @"DuongDH";
    user.email = @"duongdh93@gmail.com";
    user.phoneNumber = @"984727410";
    id<IDataStore> dataStore = [backendless.persistenceService of:[GSUser class]];
    [dataStore save:user responder:responder];
}

#pragma mark - responder
- (id)responseHandler:(id)response {
    NSLog(@"%@", response);
    return response;
}

- (id)errorHandler:(Fault *)fault {
    NSLog(@"Error: %@", fault.detail);
    return fault;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
