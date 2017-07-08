//
//  Target_testModule.m
//  BasicProject
//
//  Created by lanfeng on 17/1/17.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "Target_testModule.h"
#import "TestModuleViewController.h"

typedef void (^CTUrlRouterCallbackBlock)(NSDictionary *info);

@implementation Target_testModule
- (TestModuleViewController *)Action_testModuleViewController:(NSDictionary *)parameters {
    // 做 Controller 的初始化工作； 未来可以在此为 controller 添加 dataManager 做为数据提者
    TestModuleViewController *viewController = [[TestModuleViewController alloc] init];
    [viewController handleRouterParameters:parameters];
    
    return viewController;
    
}

- (id)Action_showAlert:(NSDictionary *)params
{
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        CTUrlRouterCallbackBlock callback = params[@"cancelAction"];
        if (callback) {
            callback(@{@"alertAction":action});
        }
    }];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        CTUrlRouterCallbackBlock callback = params[@"confirmAction"];
        if (callback) {
            callback(@{@"alertAction":action});
        }
    }];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"alert from Module A" message:params[@"message"] preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:cancelAction];
    [alertController addAction:confirmAction];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    return nil;
}


- (id)Action_nativePresentImage:(NSDictionary *)params
{
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.title = @"this is success page";
    viewController.view.backgroundColor = [UIColor blueColor];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:viewController animated:YES completion:nil];
    return nil;
}

- (id)Action_nativeNoImage:(NSDictionary *)params
{
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.title = @"no image";
    viewController.view.backgroundColor = [UIColor orangeColor];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:viewController animated:YES completion:nil];
    
    return nil;
}
@end
