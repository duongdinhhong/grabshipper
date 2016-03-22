//
//  SafeValue.m
//  Presena
//
//  Created by Developer on 5/6/15.
//  Copyright (c) 2015 Paditech. All rights reserved.
//

#import "SafeValue.h"

@implementation SafeValue

#pragma mark - Dictionary

+ (NSDictionary *)dictionaryForKey:(id)key fromDictionary:(NSDictionary *)dictionary
{
    return [self objectOfKind:[NSDictionary class] forKey:key fromDictionary:dictionary];
}

+ (NSArray *)arrayForKey:(id)key fromDictionary:(NSDictionary *)dictionary
{
    return [self objectOfKind:[NSArray class] forKey:key fromDictionary:dictionary];
}

+ (NSString *)stringForKey:(id)key fromDictionary:(NSDictionary *)dictionary
{
    return [self objectOfKind:[NSString class] forKey:key fromDictionary:dictionary];
}

+ (NSNumber *)numberForKey:(id)key fromDictionary:(NSDictionary *)dictionary
{
    return [self objectOfKind:[NSNumber class] forKey:key fromDictionary:dictionary];
}

+ (id)objectOfKind:(Class)cls forKey:(id)key fromDictionary:(NSDictionary *)dictionary
{
    if (![dictionary isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    id obj = [dictionary objectForKey:key];
    
    if (![obj isKindOfClass:cls]) {
        return nil;
    }
    
    return obj;
}



#pragma mark - Add New

+ (NSDate *)dateForKey:(id)key fromDictionary:(NSDictionary *)dict format:(NSString *)format
{
    NSString *dateString = [self objectOfKind:[NSString class] forKey:key fromDictionary:dict];
    
    return [self dateFromString:dateString format:format];
}

+ (NSDate *)dateForKey:(id)key fromDictionary:(NSDictionary *)dict
{
    return [self dateForKey:key fromDictionary:dict format:@"yyyy-MM-dd HH:mm:ss"];
}


+ (NSDate *)dateFromString:(NSString *)dateString format:(NSString *)format
{
    static NSDateFormatter *dateFormater = nil;
    
    if (!dateFormater) {
        dateFormater = [[NSDateFormatter alloc] init];
    }
    
    [dateFormater setDateFormat:format];
    
    return [dateFormater dateFromString:dateString];
}


#pragma mark - Process null

+ (BOOL)isNullObject:(id)rawObject
{
    if (!rawObject || [rawObject isKindOfClass:[NSNull class]])
        return YES;
    
    return NO;
}

+ (BOOL)isEmptyString:(NSString *)rawString
{
    if ([[self class] isNullObject:rawString])
        return YES;
    else if (![rawString isKindOfClass:[NSString class]])
        return YES;
    else if ([rawString isEqualToString:@""])
        return YES;
    
    return NO;
}

+ (NSString *)safeString:(NSString *)rawString
{
    if ([[self class] isEmptyString:rawString])
        return @"";
    else
        return rawString;
}

+ (id)safeDictionary:(id)object
{
    if (![object isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    return object;
}

+ (NSString *)trimmingText:(NSString *)string {
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
