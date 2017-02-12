//
//  NewsViewModel.h
//  BasicProject
//
//  Created by LanFeng on 2017/2/6.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "BaseViewModel.h"

@interface NewsViewModel : BaseViewModel

@property (nonatomic, strong, readonly) NSArray *newsList;

@property (nonatomic, strong, readonly) RACCommand *refreshDataCommand;
@property (nonatomic, strong, readonly) RACCommand *netPageCommand;
@end
