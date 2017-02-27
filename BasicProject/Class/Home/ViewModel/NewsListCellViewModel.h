//
//  NewsListCellViewModel.h
//  BasicProject
//
//  Created by lanfeng on 17/2/13.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "BaseViewModel.h"

@interface NewsListCellViewModel : BaseViewModel

@property (nonatomic, assign, readonly) NSInteger ID;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, assign, readonly) int type;
@property (nonatomic, strong, readonly) NSArray<NSString *> *images;
@property (nonatomic, strong, readonly) NSString *ga_prefex;

@end
