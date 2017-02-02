//
//  BaseAPIManager.h
//  BasicProject
//
//  Created by LanFeng on 2017/1/28.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTKRequest.h"

@class BaseAPIManager;
@protocol APIManagerDataReformer <NSObject>
@required

- (id)manager:(BaseAPIManager *)manager reformData:(NSDictionary *)data;
@end

@interface BaseAPIManager : YTKRequest
- (id)fetchDataWithReformer:(id<APIManagerDataReformer>)reformer;
@end
