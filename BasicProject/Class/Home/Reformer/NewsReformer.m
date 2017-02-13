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
#import "Story.h"
#import "NewsListCellViewModel.h"


NSString * const kNewsReformerListDataKey = @"kLFNewsReformerListDataKey";
NSString * const kNewsReformerTopStoriesDataKey = @"kNewsReformerTopStoriesDataKey";

@implementation NewsReformer
- (id)manager:(BaseAPIManager *)manager reformData:(NSDictionary *)data {
    //转模型？传递字典、去model？
    //返回视图能够直接用于显示的数据
//    NSArray *stories = [Story mj_objectArrayWithKeyValuesArray:data[@"stories"]];
//    NSMutableArray *modelArray = [NSMutableArray arrayWithCapacity:20];
//    for (Story *story in modelArray) {
//        [modelArray addObject:[[NewsListCellViewModel alloc] initWithModel:story]];
//    }
    
    NSMutableDictionary *mutDict = [NSMutableDictionary dictionaryWithDictionary:data];
    [mutDict removeObjectForKey:@"top_stories"];
    LatestNews *news = [LatestNews mj_objectWithKeyValues:mutDict];
    
    NSMutableArray *mutArray = [NSMutableArray arrayWithCapacity:4];
    [mutArray addObject:news];
    
    return @{kNewsReformerListDataKey : [mutArray copy] ? : @"", kNewsReformerTopStoriesDataKey : data[@"top_stories"] ? : @""};
}
@end
