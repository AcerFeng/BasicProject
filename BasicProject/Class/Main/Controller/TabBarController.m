//
//  TabBarController.m
//  BasicProject
//
//  Created by lanfeng on 17/1/16.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "TabBarController.h"
#import "MainNavigationController.h"
#import "HomeViewController.h"
#import "MineViewController.h"
#import "Navigator.h"

@interface TabBarController ()<UITabBarControllerDelegate>

@end

@implementation TabBarController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self lf_setupSubViewController];
    __weak TabBarController *weakSelf = self;
    self.delegate = weakSelf;
}

#pragma mark - private methods
- (void)lf_setupSubViewController {
    // 1.添加第一个控制器
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    [self lf_addNavigationController:homeViewController image:[UIImage imageNamed:@"tab_home_icon"] title:@"首页"];
    
    MineViewController *mineViewController = [[MineViewController alloc] init];
    [self lf_addNavigationController:mineViewController image:[UIImage imageNamed:@"user"] title:@"我的"];
    
    [[Navigator sharedNavigator] setMainNavigationController:(UINavigationController *)[self.childViewControllers firstObject]];
}

- (void)lf_addNavigationController:(UIViewController *)controller image:(UIImage *)image title:(NSString *)title {
    MainNavigationController *navC = [[MainNavigationController alloc] initWithRootViewController:controller];
    navC.title = title;
    navC.tabBarItem.image = image;
    [navC.navigationBar setBackgroundImage:[UIImage imageNamed:@"commentary_num_bg"] forBarMetrics:UIBarMetricsDefault];
    controller.title = title;
    [self addChildViewController:navC];
}

#pragma mark - UITabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    if (![viewController isKindOfClass:[UINavigationController class]]) {
        NSLog(@"tabBar 出错");
        return;
    }
    [[Navigator sharedNavigator] setMainNavigationController:(UINavigationController *)viewController];
}

@end
