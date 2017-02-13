//
//  NewsViewModel.m
//  BasicProject
//
//  Created by LanFeng on 2017/2/6.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "NewsViewModel.h"
#import "NewsAPIRequest.h"
#import "NewsReformer.h"
#import "LatestNews.h"

@interface NewsViewModel ()

@property (nonatomic, strong, readwrite) NSArray *newsList;
@property (nonatomic, strong) NSArray *testlist;
@property (nonatomic, strong, readwrite) RACCommand *refreshDataCommand;
@property (nonatomic, strong, readwrite) RACCommand *netPageCommand;

@property (nonatomic, strong) NewsAPIRequest *newsAPIRequest;
@end

@implementation NewsViewModel
- (void)lf_initialize {
    @weakify(self);
    [self.refreshDataCommand.executionSignals.switchToLatest subscribeNext:^(NSDictionary *dict) {
        @strongify(self);
        if (!dict.count || !dict[@"stories"] || !dict[@"top_stories"] || !dict[@"date"]) {
            NSLog(@"获取数据有误");
            return;
        }
        
        NSDictionary *data = [self.newsAPIRequest fetchDataWithReformer:[[NewsReformer alloc] init]];
        self.newsList = data[kNewsReformerListDataKey];
        self.testlist = data[kNewsReformerTopStoriesDataKey];
        
        
    }];
}

#pragma mark - getters and setters
- (RACCommand *)refreshDataCommand {
    if (!_refreshDataCommand) {
        @weakify(self);
        _refreshDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                @strongify(self);
                [self.newsAPIRequest startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
                    [subscriber sendNext:request.responseJSONObject];
                    [subscriber sendCompleted];
                } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
                    NSLog(@"请求失败");
                    [subscriber sendCompleted];
                }];
                return nil;
            }];
        }];
    }
    return _refreshDataCommand;
}

- (NewsAPIRequest *)newsAPIRequest {
    if (!_newsAPIRequest) {
        _newsAPIRequest = [[NewsAPIRequest alloc] init];
    }
    return _newsAPIRequest;
}

@end
