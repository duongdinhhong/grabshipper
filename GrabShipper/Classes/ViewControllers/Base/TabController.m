////
////  TabController.m
////  ATVS
////
////  Created by Arzenal Zkull on 1/5/16.
////  Copyright © 2016 Paditech. All rights reserved.
////
//
//#import "TabController.h"
//#import "ViewController.h"
//#import "CustomNaviViewController.h"
//#import "DemoViewController.h"
//#import "FFSearchRestViewController.h"
//#import "FFProfileViewController.h"
//#import "FFUser.h"
//#import "FFRequestLoginView.h"
//#import "FFHomeViewController.h"
//#import "FFShopsNearViewController.h"
//#import "FFAddStoreViewController.h"
//#import "FFLoginViewController.h"
//
//@interface TabController () {
//    NSInteger lastSelectedIndex;
//    CGFloat tabbarHeight;
//}
//
//@end
//
//@implementation TabController
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    
////    if (SCREEN_HEIGHT <= 568) {
////        tabbarHeight = 49;
////    } else if (SCREEN_HEIGHT <= 667) {
////        tabbarHeight = 60;
////    } else {
////        tabbarHeight = 65;
////    }
//    
//    // SETUP VIEWCONTROLLER
////    DemoViewController *view1 = [[DemoViewController alloc] init];
////    FFHomeViewController *homeVC = [[FFHomeViewController alloc] init];
////    DemoViewController *view2 = [[DemoViewController alloc] init];
////    FFShopsNearViewController *nearShopsVC = [[FFShopsNearViewController alloc] init];
////    FFAddStoreViewController *view3 = [[FFAddStoreViewController alloc] init];
////    FFSearchRestViewController *view4 = [[FFSearchRestViewController alloc] init];
////    FFProfileViewController *view5 = [[FFProfileViewController alloc] init];
//    
////    CustomNaviViewController *navi1 = [[CustomNaviViewController alloc] initWithRootViewController:view1];
//    CustomNaviViewController *navi1 = [[CustomNaviViewController alloc] initWithRootViewController:homeVC];
//    CustomNaviViewController *navi2 = [[CustomNaviViewController alloc] initWithRootViewController:nearShopsVC];
//    CustomNaviViewController *navi3 = [[CustomNaviViewController alloc] initWithRootViewController:view3];
//    CustomNaviViewController *navi4 = [[CustomNaviViewController alloc] initWithRootViewController:view4];
//    CustomNaviViewController *navi5 = [[CustomNaviViewController alloc] initWithRootViewController:view5];
//    
//    NSArray *arrayVC = @[navi1, navi2, navi3, navi4, navi5];
//    self.viewControllers = arrayVC;
//    
//    self.footerView = [[UIView alloc] init];
//    self.footerView.frame = CGRectMake(0, SCREEN_HEIGHT - tabbarHeight, self.view.bounds.size.width,  tabbarHeight);
//    self.footerView.backgroundColor = [UIColor clearColor];      //Rgb2UIColor(39, 170, 226);
//    self.footerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
//
//    NSInteger numberOfButton = 5;
//    NSArray *buttonNameArray = @[ @"", @"", @"", @"", @"" ];
//    NSArray *buttonImageArray = @[ @"home", @"nere", @"add", @"search", @"acc"];
//    
//    NSString *buttonImage1 = [NSString stringWithFormat:@"ic_%@", buttonImageArray[0]];
//    UIImage *img1 = [UIImage imageNamed:buttonImage1];
//    self.footerView.frame = CGRectMake(0, self.view.bounds.size.height - tabbarHeight - 20, self.view.bounds.size.width,  img1.size.height);
//    CGFloat width = 0;
//    for (int i=0; i<numberOfButton; i++) {
//        
//        NSString *buttonImage = [NSString stringWithFormat:@"ic_%@", buttonImageArray[i]];
//        NSString *buttonName = buttonNameArray[i];
//        UIImage *img = [UIImage imageNamed:buttonImage];
//        CGRect frame = CGRectMake(SCREEN_WIDTH/5 * i, 0, SCREEN_WIDTH/5, tabbarHeight);
//        UIButtonWithImageAndText *button = [self buttonWithFrame:frame image:buttonImage title:buttonName];
//        
//        [button setTag:(i+10)];
//        [button addTarget:self action:@selector(btnTabItemTouched:) forControlEvents:UIControlEventTouchUpInside];
//        
//        [self.footerView addSubview:button];
//        if (i == 0) {
//            [self btnTabItemTouched:button];
//        }
//        
//    }
//
//    [[self tabBar] addSubview:self.footerView];
//    self.delegate = self;
//    
//    // Set tabbar background color
//    [[UITabBar appearance] setBarTintColor:[UIColor clearColor]];
//    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
//    UIImage *clearImage = [FFLoginViewController createImageWithSize:CGSizeMake(1.0, 1.0) andColor:[UIColor clearColor]];
//    [[UITabBar appearance] setShadowImage:clearImage];
//    
//    
//}
//
//- (void)viewWillLayoutSubviews
//{
//    [super viewWillLayoutSubviews];
//    
//    [self.tabBar invalidateIntrinsicContentSize];
//    
//    UIImage *img1 = [UIImage imageNamed:@"ic_home.png"];
//    
//    CGFloat tabSize = img1.size.height;
//    
//    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
//    
//    if (UIInterfaceOrientationIsLandscape(orientation))
//    {
//        tabSize = 32.0;
//    }
//    
//    CGRect tabFrame = self.tabBar.frame;
//    
//    tabFrame.size.height = tabSize;
//    
//    tabFrame.origin.y = 20;
//    
//    self.tabBar.frame = tabFrame;
//    
//    self.tabBar.translucent = YES;
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//}
//
//- (UIButtonWithImageAndText *)buttonWithFrame:(CGRect)frame image:(NSString *)imageName title:(NSString *)title
//{
//    NSString *selectedName = [NSString stringWithFormat:@"%@_ac", imageName];
//    
//    UIColor *textColor = [UIColor colorWithRed:17/255.0 green:118/255.0 blue:166/255.0 alpha:1];
//    
//    UIButtonWithImageAndText *button = [[UIButtonWithImageAndText alloc] initWithFrame:frame];
//    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//    [button setBackgroundImage:[UIImage imageNamed:selectedName] forState:UIControlStateSelected];
//    
//    [button setTitle:title forState:UIControlStateNormal];
//    [button setTitleColor:textColor forState:UIControlStateNormal];
//
////    button.imageEdgeInsets = UIEdgeInsetsMake(20,20,20,20);
//    button.titleLabel.font = [UIFont systemFontOfSize:11.0f];
//    
//    return button;
//}
//
//- (IBAction)btnTabItemTouched:(id)sender
//{
//    UIButton *button = (UIButton *)sender;
//    NSInteger selectedIndex = button.tag - 10;
//    if (selectedIndex>=0 && selectedIndex<self.viewControllers.count) {
//        
//        if (selectedIndex == 2|| selectedIndex == 4) {
//            if (![[FFUser shared] isLogin]) {
//                [FFRequestLoginView showWithTitle:@"Create a store" requestLogin:^(BOOL complate) {
//                    if (complate) {
//                        [self btnTabItemTouched:sender];
//                    }
//                }];
//                return;
//            }
//            if (selectedIndex == 2) {
//                [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshAddStore" object:nil];
//            }
//        }
//        // Select view
//        [self setSelectedIndex:selectedIndex];
//        // Release last selected button
//        UIButton *lastButton = (UIButton *)[self.footerView viewWithTag:(lastSelectedIndex + 10)];
//        lastButton.selected = NO;
//        // Selected new button
//        button.selected = YES;
//        // Remember selected button index
//        lastSelectedIndex = selectedIndex;
//    }
//}
//
//
//@end
