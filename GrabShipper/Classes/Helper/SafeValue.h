//
//  SafeValue.h
//  Presena
//
//  Created by Developer on 5/6/15.
//  Copyright (c) 2015 Paditech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SafeValue : NSObject

/*!
 Lookup object for that key is not kind of NSDictionary
 @param key dictionary key to look for.
 @param dictionary Dictionary to look into, should be kind of NSDictionary.
 @return Instance of object (nil if it isn't exists)
 */
+ (NSDictionary *)dictionaryForKey:(id)key fromDictionary:(NSDictionary *)dictionary;

/*!
 Lookup object for that key is not kind of NSArray
 @param key dictionary key to look for.
 @param dictionary Dictionary to look into, should be kind of NSDictionary.
 @return Instance of object (nil if it isn't exists)
 */
+ (NSArray *)arrayForKey:(id)key fromDictionary:(NSDictionary *)dictionary;

/*!
 Lookup object for that key is not kind of NSString
 @param key dictionary key to look for.
 @param dictionary Dictionary to look into, should be kind of NSDictionary.
 @return Instance of object (nil if it isn't exists)
 */
+ (NSString *)stringForKey:(id)key fromDictionary:(NSDictionary *)dictionary;

/*!
 Lookup object at that index is not kind of NSNumber
 @return Instance of object (nil if it isn't exists)
 @param key dictionary key to look for.
 @param dictionary Dictionary to look into, should be kind of NSDictionary.
 */
+ (NSNumber *)numberForKey:(id)key fromDictionary:(NSDictionary *)dictionary;

/*!
 Lookup object at that index is not kind of given class
 @param key dictionary key to look for.
 @param dictionary Dictionary to look into, should be kind of NSDictionary.
 @return Instance of object (nil if it isn't exists)
 */
+ (id)objectOfKind:(Class)cls forKey:(id)key fromDictionary:(NSDictionary *)dictionary;

/*!
 Lookup object for that key is not kind of NSDate
 @param key dictionary key to look for.
 @param dictionary Dictionary to look into, should be kind of NSDictionary.
 @return Instance of object (nil if it isn't exists)
 */
+ (NSDate *)dateForKey:(id)key fromDictionary:(NSDictionary *)dict;

/*!
 Lookup object for that key is not kind of NSDate
 @param key dictionary key to look for.
 @param dictionary Dictionary to look into, should be kind of NSDictionary.
 @return Instance of object (nil if it isn't exists)
 */
+ (NSDate *)dateForKey:(id)key fromDictionary:(NSDictionary *)dict format:(NSString *)format;


+ (BOOL)isNullObject:(id)rawObject;
+ (BOOL)isEmptyString:(NSString *)rawString;
+ (NSString *)safeString:(NSString *)rawString;
+ (id)safeDictionary:(id)object;
+ (NSString *)trimmingText:(NSString *)string;


@end
