//
//  Navigator.m
//  BasicProject
//
//  Created by lanfeng on 17/1/17.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "Navigator.h"

@interface Navigator ()
@property (nonatomic, strong, readwrite) UINavigationController *navigationController;
@end


@implementation Navigator

#pragma mark - life cycle
+ (instancetype)sharedNavigator {
    static Navigator *navigator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        navigator = [[Navigator alloc] init];
    });
    return navigator;
}

#pragma mark - public methods
- (void)setMainNavigationController:(UINavigationController *)navigationController {
    self.navigationController = navigationController;
}

- (void)navPushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (viewController == nil || ![viewController isKindOfClass:[UIViewController class]]) {
        NSLog(@"找不到指定页面");
        return;
    }
    [self.navigationController pushViewController:viewController animated:animated];
}

@end
