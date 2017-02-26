//
//  NewsAPIRequest.m
//  BasicProject
//
//  Created by LanFeng on 2017/1/30.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "NewsAPIRequest.h"

@implementation NewsAPIRequest

- (NSString *)requestUrl {
    return @"https://news-at.zhihu.com/api/4/news/latest";
}

//- (YTKRequestMethod)requestMethod {
//    return YTKRequestMethodPOST;
//}

- (id)requestArgument {
    return @{@"page" : @1};
}

@end
