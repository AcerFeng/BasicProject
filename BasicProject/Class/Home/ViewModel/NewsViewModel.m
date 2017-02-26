//
//  NewsViewModel.m
//  BasicProject
//
//  Created by LanFeng on 2017/2/6.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "NewsViewModel.h"
#import "NewsAPIRequest.h"
#import "TableViewSectionViewModel.h"
#import "Story.h"
#import "MJExtension.h"
#import "NewsListCellViewModel.h"
#import "LatestNews.h"

@interface NewsViewModel ()

@property (nonatomic, strong, readwrite) NSMutableArray *newsList;
@property (nonatomic, strong) NSArray *testlist;
@property (nonatomic, strong, readwrite) RACSubject *refreshUI;
@property (nonatomic, strong, readwrite) RACCommand *refreshDataCommand;
@property (nonatomic, strong, readwrite) RACCommand *nextPageCommand;

@property (nonatomic, strong) NewsAPIRequest *newsAPIRequest;
@end

@implementation NewsViewModel
- (void)lf_initialize {
    @weakify(self);
    [self.refreshDataCommand.executionSignals.switchToLatest subscribeNext:^(NSDictionary *dict) {
        @strongify(self);
        LatestNews *news = [LatestNews mj_objectWithKeyValues:dict];
        
        NSArray *storiesViewModels = [news.stories.rac_sequence map:^id(Story *model) {
            NewsListCellViewModel *viewModel = [[NewsListCellViewModel alloc] initWithModel:model];
            return viewModel;
        }].array;
        
        TableViewSectionViewModel *sectionViewModel = [[TableViewSectionViewModel alloc] init];
        sectionViewModel.headerTitle = news.date;
        sectionViewModel.cellViewModels = storiesViewModels;
        
        [self.newsList removeAllObjects];
        [self.newsList addObject:sectionViewModel];;
        
        [self.refreshUI sendNext:nil];
    }];
    
    [self.nextPageCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        @strongify(self);
        [self.newsList addObject:x];
    }];
}

#pragma mark - getters and setters
- (NSMutableArray *)newsList {
    if (!_newsList) {
        _newsList = [NSMutableArray arrayWithCapacity:20];
    }
    return _newsList;
}

- (RACSubject *)refreshUI {
    
    if (!_refreshUI) {
        
        _refreshUI = [RACSubject subject];
    }
    
    return _refreshUI;
}

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

- (RACCommand *)nextPageCommand {
    if (!_nextPageCommand) {
        @weakify(self);
        _nextPageCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                return nil;
            }];
        }];
    }
    return _nextPageCommand;
}

- (NewsAPIRequest *)newsAPIRequest {
    if (!_newsAPIRequest) {
        _newsAPIRequest = [[NewsAPIRequest alloc] init];
    }
    return _newsAPIRequest;
}

@end
