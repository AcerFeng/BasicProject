
//
//  BaseAPIManager.m
//  BasicProject
//
//  Created by LanFeng on 2017/1/28.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "BaseAPIManager.h"

@interface BaseAPIManager ()<YTKRequestAccessory>

@end

@implementation BaseAPIManager

- (instancetype)init {
    self = [super init];
    if (self) {
#if DEBUG
        //将自己添加 才能调用 YTKRequestAccessory 的方法
        //用于打印 request 信息
        [self addAccessory:self];
#endif
    }
    return self;
}

#pragma mark - Public methods
- (id)fetchDataWithReformer:(id<APIManagerDataReformer>)reformer
{
    id resultData = nil;
    if ([reformer respondsToSelector:@selector(manager:reformData:)]) {
        resultData = [reformer manager:self reformData:self.responseJSONObject];
    } else {
        resultData = [self.responseJSONObject mutableCopy];
    }
    return resultData;
}

#pragma mark - YTKRequestAccessory
- (void)requestWillStart:(id)request {
    
}

- (void)requestWillStop:(id)request {
    
}

- (void)requestDidStop:(id)request {
    
}
@end
