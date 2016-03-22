//
//  Defined.h
//  MaidApp
//
//  Created by PaditechDev1 on 28/05/2015.
//  Copyright (c) Năm 2015 MCLAB. All rights reserved.
//

#ifndef MaidApp_Defined_h
#define MaidApp_Defined_h

#ifdef DEBUG
#define ZLog(format, ...) NSLog(@"%s:%@", __PRETTY_FUNCTION__,[NSString stringWithFormat:format, ## __VA_ARGS__]);
#else
#define ZLog(format, ...)
#endif

// APP URL
#define kBaseURL @"http://powercontacts.zaovat.net/contacts/"
#define kVersion @"/contact/"
#define kBaseImageURL @""

#define IOSVERSION [[[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."] objectAtIndex:0]

/// CHECK IPhone and OS Version
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#define IS_OS_5_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
#define IS_OS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define WINSIZE [CAAppDelegate shareAppdelegate].window.frame.size
#define SCREENSIZE [[UIScreen mainScreen] bounds].size

#define iPhone568 (WINSIZE.height == 568.0)
#define iPhone480 (WINSIZE.height <= 480.0)
#define ccp(__x__, __y__) CGPointMake(__x__, __y__)

// Color Macro
#define RGBA2UIColor(r, g, b, a)  [UIColor colorWithRed:(((float)r) / 255.0) green:(((float)g) / 255.0) blue:(((float)b) / 255.0) alpha:a]
#define Rgb2UIColor(r, g, b)  RGBA2UIColor(r, g, b, 1.0)
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define kBlackColor Rgb2UIColor(39,33,42)
#define kRedColor Rgb2UIColor(192,44,59)
#define kPinkColor Rgb2UIColor(255,115,162)
#define kBlueColor Rgb2UIColor(6,165,163)

#define radians(degrees) (degrees * M_PI/180)

#define LANGTEXT(KEY)   NSLocalizedString(KEY, nil)

#define KEY_UPDATE_NOTIFICATION @"key_update_notification"

#define kLabelHeight 10
#define kLabelMargin 5
#define kImageViewMargin 5

// Image Holder
#define kAvatarPlaceHolder [UIImage imageNamed:@"profile"]
#define kImagePlaceHolder [UIImage imageNamed:@"Defaults.png"]
#define kPostHolder [UIImage imageNamed:@"default_post"]

#define SETTINGs [NSUserDefaults standardUserDefaults]

#define kDUID @"kDUID"

// Notification Setting
#define kNOTIFYCATION_MAINMENU_OPEN @"MENU_OPEN"
#define kNOTIFYCATION_MAINMENU_CLOSE @"MENU_OPEN"
#define kChoosePickerViewNotification @"CHOOSE_PIKCER_VIEW_NOTIFI"
#define kNotificationCenterUpdateNoticeNum @"Update_Notice_Num"

// Token Key
#define kDEVICE_TOKEN_KEY @"DEVICE_TOKEN_KEY"
#define kAPI_TOKEN @"X-API-TOKEN"
#define kFB_TOKEN @"FB_TOKEN_KEY"

#define kNetworkError_Notification @"Network_Error"

#endif
