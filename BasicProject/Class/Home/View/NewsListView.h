//
//  NewsListView.h
//  BasicProject
//
//  Created by LanFeng on 2017/2/8.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "BaseView.h"

@interface NewsListView : BaseView
@property (nonatomic, strong, readonly) NSArray *adList;
@property (nonatomic, strong, readonly) NSArray *newsList;

@property (nonatomic, strong, readonly) RACCommand *refreshDataCommand;
@property (nonatomic, strong, readonly) RACCommand *netPageCommand;
@end
