//
//  CustomNaviViewController.m
//  ATVS
//
//  Created by Arzenal Zkull on 1/5/16.
//  Copyright © 2016 Paditech. All rights reserved.
//

#import "CustomNaviViewController.h"
#import "CustomNavigationBar.h"

@interface CustomNaviViewController ()

@property (nonatomic) UIBarButtonItem *backBarButtonItem;

@end

@implementation CustomNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self setNavigationBarHidden:YES animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
    self.interactivePopGestureRecognizer.enabled = NO; // disable
}

- (void)styleNavBar {
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
//    
//    UINavigationBar *newNavBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 80.0)];
//    newNavBar.barTintColor = [UIColor colorWithRed:0.153 green:0.667 blue:0.886 alpha:1];
//    newNavBar.translucent = NO;
//    newNavBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
//    newNavBar.tintColor = [UIColor whiteColor];
//    
//    UINavigationItem *newItem = [[UINavigationItem alloc] init];
//    newItem.title = @"Shop Detail";
//    
//    self.backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_acc"] style:UIBarButtonItemStylePlain target:self action:@selector(backTapped:)];
//    [newItem setLeftBarButtonItem:self.backBarButtonItem];
//    
//    [newNavBar setItems:@[newItem]];
//    
//    [self.view addSubview:newNavBar];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
