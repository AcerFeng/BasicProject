//
//  Router.h
//  BasicProject
//
//  Created by lanfeng on 17/1/17.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Router : NSObject
+(instancetype)sharedRouter;

// 远程App调用入口
- (id)performActionWithUrl:(NSURL *)url;
- (id)performActionWithUrl:(NSURL *)url completion:(void(^)(NSDictionary *info))completion;
// 本地组件调用入口
- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params shouldCacheTarget:(BOOL)shouldCacheTarget;
// 清除 target 缓存
- (void)releaseCachedTargetWithTargetName:(NSString *)targetName;

@end
