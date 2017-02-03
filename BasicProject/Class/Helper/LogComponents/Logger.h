//
//  Logger.h
//  BasicProject
//
//  Created by lanfeng on 17/2/3.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import <Foundation/Foundation.h>


@class YTKRequest;
@interface Logger : NSObject

+ (instancetype)sharedInstance;

+ (void)logDebugInfoWithRequest:(YTKRequest *)request;
+ (void)logDebugInfoWithResponse:(YTKRequest *)request;
//+ (void)logDebugInfoWithCachedResponse:(CTURLResponse *)response methodName:(NSString *)methodName serviceIdentifier:(CTService *)service;


@end
