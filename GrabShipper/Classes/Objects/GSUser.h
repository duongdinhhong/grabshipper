//
//  GSUser.h
//  GrabShipper
//
//  Created by Dinh Hong Duong on 2/26/16.
//  Copyright © 2016 DInh Hong Duong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSUser : NSObject

//@property (nonatomic) NSInteger Id;
//@property (nonatomic, strong) NSString *facebookId;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *password;
@property (nonatomic) NSInteger type;
//@property (nonatomic, strong) NSString *token;
//@property (nonatomic, strong) NSString *fb_token;
//@property (nonatomic) BOOL verified;

+ (GSUser *)shared;

/*
 * Method to get User Object by parsing JSON
 * @param dicionary : JSON dictionary to parse
 */
//- (instancetype)initWithDictionary:(NSDictionary*)data;
- (void)setDefaultValue;
- (void)setDataWithDictionary:(NSDictionary*)data;
- (void)save;
- (void)clearUser;
- (BOOL)isLogin;
- (void)showUserInfo;

@end
