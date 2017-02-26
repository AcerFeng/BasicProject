//
//  NewsViewModel.h
//  BasicProject
//
//  Created by LanFeng on 2017/2/6.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "BaseViewModel.h"

@interface NewsViewModel : BaseViewModel

@property (nonatomic, strong, readonly) NSMutableArray *newsList;
@property (nonatomic, strong, readonly) RACSubject *refreshUI;
@property (nonatomic, strong, readonly) RACCommand *refreshDataCommand;
@property (nonatomic, strong, readonly) RACCommand *nextPageCommand;
@end
