//
//  NewsListCellViewModel.h
//  BasicProject
//
//  Created by lanfeng on 17/2/13.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "BaseViewModel.h"

@interface NewsListCellViewModel : BaseViewModel
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) int type;
@property (nonatomic, strong) NSArray<NSString *> *images;
@property (nonatomic, strong) NSString *ga_prefex;
@end
