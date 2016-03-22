//
//  TabController.h
//  ATVS
//
//  Created by Arzenal Zkull on 1/5/16.
//  Copyright © 2016 Paditech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GIBadgeView.h"

@interface TabController : UITabBarController<UITabBarControllerDelegate>

@property (strong, nonatomic) UIView *footerView;
@property (strong, nonatomic) UIButton *buttonProfile;

@end
