//
//  Navigator+Router.m
//  BasicProject
//
//  Created by lanfeng on 17/1/17.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "Navigator+Router.h"
#import "Router.h"

@implementation Navigator (Router)
- (BOOL)navigateTo:(NSURL *)URL {
    if (![URL.absoluteString hasPrefix:@"testSchemes"]) {
        NSLog(@"url 地址有误");
        return NO;
    }
    //通过路由跳转
    id resutl = [[Router sharedRouter] performActionWithUrl:URL];
    if ([resutl isKindOfClass:[UIViewController class]]) {
        [self navPushViewController:(UIViewController *)resutl animated:YES];
        return YES;
    } else {
        // 可以 push 到 notFoundViewController 自行决定
        return NO;
    }
}
@end
