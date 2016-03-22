//
//  GSUser.m
//  GrabShipper
//
//  Created by Dinh Hong Duong on 2/26/16.
//  Copyright © 2016 DInh Hong Duong. All rights reserved.
//

#import "GSUser.h"
#import "NSData+Encrypt.h"
#import "SafeValue.h"
#import "Defined.h"

#define USER_INFO_VERSION_KEY @"USER_INFO_VERSION_KEY"
#define USER_INFO_VERSION_VALUE @"1.0"
#define USER_INFO_PATH [NSHomeDirectory() stringByAppendingString:@"/Documents/USERINFO"]
#define USER_AES256_ENCRYPT @"GrabShipper"

static GSUser *shareUser;

@implementation GSUser

+ (GSUser *)shared {
    if (!shareUser) {
        shareUser = [[GSUser alloc] init];
        [shareUser load];
    }
    return shareUser;
}
- (instancetype)init {
    if (self = [super init]) {
        [self load];
    }
    return self;
}/*!
  *  Set with data load
  */
- (void)setDataWithDictionary:(NSDictionary*)data {
//    if (data[@"facebookid"]) {
//        self.facebookId = [SafeValue stringForKey:@"facebookid" fromDictionary:data];
//    }
//    if (data[@"fb_token"]) {
//        self.fb_token = [SafeValue stringForKey:@"fb_token" fromDictionary:data];
//    }
//    if (data[@"id"]) {
//        self.Id = [[SafeValue numberForKey:@"id" fromDictionary:data] integerValue];
//    }
    if (data[@"username"]) {
        self.username = [SafeValue stringForKey:@"username" fromDictionary:data];
    }
    if (data[@"email"]) {
        self.email = [SafeValue stringForKey:@"email" fromDictionary:data];
    }
//    if (data[@"token"]){
//        self.token = [SafeValue stringForKey:@"token" fromDictionary:data];
//    }
    if (data[@"phoneNumber"]){
        self.phoneNumber = [SafeValue stringForKey:@"phoneNumber" fromDictionary:data];
    }
    if (data[@"type"]){
        self.type = [[SafeValue numberForKey:@"type" fromDictionary:data] integerValue];
    }
}

- (void)setDefaultValue {
//    self.Id = 0;
//    self.facebookId = @"";
    self.username = @"";
    self.email = @"";
    self.password = @"";
    self.phoneNumber = @"";
//    self.token = @"";
//    self.fb_token = @"";
//    self.verified = NO;
    self.type = 1;
}

- (void)load {
    NSLog(@"User Info Path: %@", USER_INFO_PATH);
    NSData *data = [NSData dataWithContentsOfFile:USER_INFO_PATH];
    NSString *userInfoVersion = [SETTINGs valueForKey:USER_INFO_VERSION_KEY];
    if (data && data.length > 0 && [userInfoVersion isEqualToString:USER_INFO_VERSION_VALUE]) {
        NSDictionary *dictionary = [self decryptInfo:data];
        [self setDataWithDictionary:dictionary];
        ZLog(@"User Infor save in device: %@",dictionary);
    } else {
        [self setDefaultValue];
    }
}

- (id)decryptInfo:(id)data {
    NSData *decryptData = [data AES256DecryptWithKey:USER_AES256_ENCRYPT];
    return [NSKeyedUnarchiver unarchiveObjectWithData:decryptData];
}

/*!
 * Method Decrypt User info
 * @param   NSDictionary: user info
 * @return  NSData: data encryption
 */
- (NSData*)encryptData:(id)data {
    NSData *encryptData = [NSKeyedArchiver archivedDataWithRootObject:data];
    return [encryptData AES256EncryptWithKey:USER_AES256_ENCRYPT];
}

/*!
 *  Save user
 */
- (void)save {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
//    dictionary[@"facebookid"] = self.facebookId;
//    dictionary[@"id"] = [NSNumber numberWithInteger:self.Id];
    dictionary[@"username"] = self.username;
    dictionary[@"password"] = self.password;
    dictionary[@"email"] = self.email;
//    dictionary[@"fb_token"] = self.fb_token;
//    dictionary[@"token"] = self.token;
    dictionary[@"password"] = self.password;
    dictionary[@"type"] = [NSNumber numberWithInteger:self.type];
    
    NSData *data = [self encryptData:dictionary];
    [data writeToFile:USER_INFO_PATH atomically:YES];
    [SETTINGs setValue:USER_INFO_VERSION_VALUE forKey:USER_INFO_VERSION_KEY];
}

- (void)clearUser {
    NSFileManager *file = [NSFileManager defaultManager];
    [file removeItemAtPath:USER_INFO_PATH error:nil];
    [self load];
}

- (BOOL)isLogin {
//    return self.token.length > 0;
    return self.username.length > 0;
}

- (void)showUserInfo {
//    NSLog(@"USERINFOR:%ld \n, %@,\n %@,\n %@, \n %@",(long)_Id, _facebookId,self.username,self.email, self.token);
}

@end
