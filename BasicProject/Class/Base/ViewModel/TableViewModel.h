//
//  TableViewModel.h
//  BasicProject
//
//  Created by LanFeng on 2017/2/25.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "BaseViewModel.h"

@interface TableViewModel : BaseViewModel
@property (nonatomic, copy) NSArray *dataSource;
@property (nonatomic, assign) NSUInteger page;
@property (nonatomic, assign) NSUInteger perPage;
@property (nonatomic, assign) BOOL shouldPullToRefresh;
@property (nonatomic, assign) BOOL shouldInfiniteScrolling;

@property (nonatomic, strong) RACCommand *didSelectCommand;
@end
