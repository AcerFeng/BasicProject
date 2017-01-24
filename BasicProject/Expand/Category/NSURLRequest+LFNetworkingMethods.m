//
//  NSURLRequest+LFNetworkingMethods.m
//  BasicProject
//
//  Created by lanfeng on 17/1/23.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "NSURLRequest+LFNetworkingMethods.h"
#import <objc/runtime.h>

static void *LFNetworkingREquestParams;

@implementation NSURLRequest (LFNetworkingMethods)
- (void)setRequestParams:(NSDictionary *)requestParams {
    objc_setAssociatedObject(self, &LFNetworkingREquestParams, requestParams, OBJC_ASSOCIATION_COPY);
}

- (NSDictionary *)requestParams {
    return objc_getAssociatedObject(self, &LFNetworkingREquestParams);
}
@end
