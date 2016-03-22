//
//  Validation.h
//  GIFT
//
//  Created by TrinhLD on 3/27/14.
//  Copyright (c) 2014 GIFT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validation : NSObject

+ (BOOL)validateStringNull:(NSString *)string;

+ (BOOL)validateEmail:(NSString*)email;

+ (BOOL)validatePassword:(NSString*)password isEqualConfirmPassword:(NSString *)confirmPassword;

+ (BOOL)validateTrackingCode:(NSString*)string;

+ (BOOL)validatePhoneNumber:(NSString*)phoneNumber;

+ (BOOL)checkNetworkConnection;

+ (BOOL)validateUsername:(NSString*)username;

@end
