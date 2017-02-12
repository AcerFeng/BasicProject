//
//  NewsReformer.m
//  BasicProject
//
//  Created by LanFeng on 2017/2/2.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "NewsReformer.h"
#import "MJExtension.h"
#import "LatestNews.h"

@implementation NewsReformer
- (id)manager:(BaseAPIManager *)manager reformData:(NSDictionary *)data {
    //转模型？传递字典、去model？
    //返回视图能够直接用于显示的数据
//    NSLog(@"-------hi-------");
//    LatestNews *news = [LatestNews mj_objectWithKeyValues:data];
    NSMutableDictionary *mutDict = [NSMutableDictionary dictionaryWithDictionary:data];
    [mutDict removeObjectForKey:@"top_stories"];
    NSMutableArray *mutArray = [NSMutableArray arrayWithCapacity:4];
    [mutArray addObject:[mutDict copy]];
    return @{@"list" : [mutArray copy] ? : @"", @"top_stories" : data[@"top_stories"] ? : @""};
}
@end
