//
//  AppDelegate.m
//  GrabShipper
//
//  Created by Dinh Hong Duong on 2/20/16.
//  Copyright (c) 2016 DInh Hong Duong. All rights reserved.
//

#import "GrabShipperAppDelegate.h"
#import "Reachability.h"
#import "SCLAlertView.h"
#import "Backendless.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "GSLoginViewController.h"
#import "GSSearchViewController.h"
#import "GSSellerRegisterViewController.h"
#import "GSHomeViewController.h"

static NSString *APP_ID = @"ACE52CD6-1243-809A-FF60-9A1A148C2C00";
static NSString *SECRET_KEY = @"E17350D0-5D39-57A8-FF0A-88423D069400";
static NSString *VERSION_NUM = @"v1";

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [backendless initApp:APP_ID secret:SECRET_KEY version:VERSION_NUM];
    @try {
        [backendless initAppFault];
    }
    @catch (Fault *fault) {
        NSLog(@"didFinishLaunchingWithOptions with Fault: %@", fault);
    }
   //Check network
    [self showNetworkConnectionAlert];
    if ([backendless.userService currentUser]) {
        //If logged in go to Home
        [self gotoHomeVC];
    } else {
        [self gotoLoginVC];
    }
    
    [self.window makeKeyAndVisible];
    
    return [[FBSDKApplicationDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
      [FBSDKAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    BOOL result = [[FBSDKApplicationDelegate sharedInstance] application:application openURL:url sourceApplication:sourceApplication
                   annotation:annotation];
    FBSDKAccessToken *token = [FBSDKAccessToken currentAccessToken];
    @try {
        BackendlessUser *user = [backendless.userService loginWithFacebookSDK:token fieldsMapping:nil];
        [backendless.userService setStayLoggedIn:YES];
        
        NSLog(@"USER: %@", user);
        [self gotoSearchVCWithUser:user];
        
    }
    @catch (Fault *fault) {
        NSLog(@"openURL: %@", fault);
    }
    return result;
}
 */

- (void)gotoLoginVC {
    GSLoginViewController *vc = [[GSLoginViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.navigationBarHidden = YES;
    self.window.rootViewController = nav;
}

- (void)gotoRegisterVC {
    GSSellerRegisterViewController *registerVC = [[GSSellerRegisterViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:registerVC];
    nav.navigationBarHidden = YES;
    self.window.rootViewController = nav;
}

- (void)gotoSearchVCWithUser:(BackendlessUser *)user {
    GSSearchViewController *vc = [[GSSearchViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.navigationBarHidden = YES;
    self.window.rootViewController = nav;
}

- (void)gotoHomeVC {
    GSHomeViewController *homeVC = [[GSHomeViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    nav.navigationBarHidden = YES;
    self.window.rootViewController = nav;
}

#pragma mark - Check network connection
- (NetworkStatus)checkNetworkConnection {
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    return networkStatus;
}

- (void)showNetworkConnectionAlert {
    if ([self checkNetworkConnection] == NotReachable) {
        //No network connection
        SCLAlertView *alert = [[SCLAlertView alloc] init];
        [alert addButton:@"Thu lai" target:self selector:@selector(showNetworkConnectionAlert)];
        
        [alert showError:self.window.rootViewController title:@"Loi ket noi!"
                subTitle:@"Vui long kiem tra tin hieu mang"
        closeButtonTitle:nil duration:0.0f];
    } else {
//        [self gotoLoginVC];
//        [self gotoRegisterVC];
    }
}

@end
