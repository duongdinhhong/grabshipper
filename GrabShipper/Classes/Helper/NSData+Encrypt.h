//
//  NSData+Encrypt.h
//  ChatApp
//
//  Created by Developer on 8/11/14.
//  Copyright (c) 2014 Paditech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Encrypt)

- (NSData *)AES256EncryptWithKey:(NSString *)key;
- (NSData *)AES256DecryptWithKey:(NSString *)key;

@end
