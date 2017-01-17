//
//  AppDelegate+CallBack.m
//  BasicProject
//
//  Created by lanfeng on 17/1/17.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "AppDelegate+CallBack.h"
#import "Navigator.h"
#import "Navigator+Router.h"

@implementation AppDelegate (CallBack)
- (BOOL)handleCallBackWith:(NSURL *)url {
    /*
     在这里可以做回调判断
     
     */
    
    // 最终
    return [[Navigator sharedNavigator] navigateTo:url];
}
@end
