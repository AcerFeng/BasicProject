//
//  Navigator.h
//  BasicProject
//
//  Created by lanfeng on 17/1/17.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Navigator : NSObject

@property (nonatomic, readonly, nullable) __kindof UINavigationController *navigationController;

+ (instancetype)sharedNavigator;

- (void)setMainNavigationController:(UINavigationController *)navigationController;

- (void)navPushViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
