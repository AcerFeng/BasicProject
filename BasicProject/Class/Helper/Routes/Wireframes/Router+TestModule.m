//
//  Router+TestModule.m
//  BasicProject
//
//  Created by lanfeng on 17/1/17.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "Router+TestModule.h"

static NSString *kTestAction = @"testModuleViewController"; // 对应Target_testModule类中的 Action_testModuleViewController: 方法
static NSString *kTestTarget = @"testModule"; //对应 Target_testModule 类

NSString * const kCTMediatorActionShowAlert = @"showAlert";

NSString * const kCTMediatorActionNativePresentImage = @"nativePresentImage";
NSString * const kCTMediatorActionNativeNoImage = @"nativeNoImage";

@implementation Router (TestModule)
- (UIViewController *)Router_testModuleViewController:(NSDictionary *)parameters {
    UIViewController *testModuleViewController = [self performTarget:kTestTarget action:kTestAction params:parameters shouldCacheTarget:NO];
    if (!testModuleViewController || ![testModuleViewController isKindOfClass:[UIViewController class]]) {
        //处理异常场景，具体如何处理取决于产品
        return nil;
    } else {
        return testModuleViewController;
    }
}

- (void)CTMediator_showAlertWithMessage:(NSString *)message cancelAction:(void(^)(NSDictionary *info))cancelAction confirmAction:(void(^)(NSDictionary *info))confirmAction
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
    if (message) {
        paramsToSend[@"message"] = message;
    }
    if (cancelAction) {
        paramsToSend[@"cancelAction"] = cancelAction;
    }
    if (confirmAction) {
        paramsToSend[@"confirmAction"] = confirmAction;
    }
    [self performTarget:kTestTarget
                 action:kCTMediatorActionShowAlert
                 params:paramsToSend
      shouldCacheTarget:NO];
}

- (void)CTMediator_presentImage:(UIImage *)image
{
    if (image) {
        [self performTarget:kTestTarget
                     action:kCTMediatorActionNativePresentImage
                     params:@{@"image":image}
          shouldCacheTarget:NO];
    } else {
        // 这里处理image为nil的场景，如何处理取决于产品
        [self performTarget:kTestTarget
                     action:kCTMediatorActionNativeNoImage
                     params:@{@"image":[UIImage imageNamed:@"1441594747553218"]}
          shouldCacheTarget:NO];
    }
}


@end
