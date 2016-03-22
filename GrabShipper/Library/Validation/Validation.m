//
//  Validation.m
//  GIFT
//
//  Created by TrinhLD on 3/27/14.
//  Copyright (c) 2014 GIFT. All rights reserved.
//

#import "Validation.h"
#import "Reachability.h"
#import "GSUser.h"
#import "Backendless.h"

@implementation Validation

+ (BOOL)validateStringNull:(NSString *)string {
    if (string == (id)[NSNull null] || string.length == 0) {
        // Not null
        return YES;
    }
    return NO;
}

+ (BOOL)validateEmail:(NSString*)email {
	email = [email lowercaseString];
    NSString *emailRegEx =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    return [regExPredicate evaluateWithObject:email];
}

+ (BOOL)validatePassword:(NSString*)password isEqualConfirmPassword:(NSString *)confirmPassword {
    if ([password isEqualToString:confirmPassword]) {
        return YES;
    }
    return NO;
}

+ (BOOL)validateTrackingCode:(NSString *)string {
    if ([string length] != 13) {
        return NO;
    }
    
    unichar char_one = [[string uppercaseString] characterAtIndex:0];
    unichar char_two = [[string uppercaseString] characterAtIndex:1];
    unichar char_three = [[string uppercaseString]characterAtIndex:11];
    unichar char_four = [[string uppercaseString]characterAtIndex:12];
    
    if (![self charIsLetter:char_one]
        || ![self charIsLetter:char_two]
        || ![self charIsLetter:char_three]
        || ![self charIsLetter:char_four]) {
        return NO;
    }
    
    for (int i = 2; i < [string length] - 2; i++) {
        if (![[NSCharacterSet decimalDigitCharacterSet] characterIsMember:[string characterAtIndex:i]]) {
            return NO;
        }
    }
    
    return YES;
}

+ (BOOL)charIsLetter:(unichar)character {
    if (character  >= 'A' && character <= 'Z') {
        return YES;
    }
    return NO;
}

+ (BOOL)validatePhoneNumber:(NSString *)phoneNumber {
    if ([phoneNumber length] < 9 || [phoneNumber length] > 10) {
        return NO;
    }
    return YES;
}

+ (BOOL)checkNetworkConnection {
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        return NO;
    }
    return YES;
}

+ (BOOL)validateUsername:(NSString *)username {
    BackendlessDataQuery *query = [BackendlessDataQuery query];
    query.whereClause = [NSString stringWithFormat:@"username = \'%@\'", username];
    BackendlessCollection *users = [backendless.persistenceService find:[GSUser class] dataQuery:query];
    if ([[users getTotalObjects] integerValue] == 0) {
        return YES;
//        NSLog(@"Username has not existed !");
    }
    return NO;
}

@end
