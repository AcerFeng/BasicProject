//
//  TableViewSectionViewModel.h
//  BasicProject
//
//  Created by LanFeng on 2017/2/25.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModelProtocol.h"

@interface TableViewSectionViewModel : NSObject

@property (nonatomic, strong) NSString *headerTitle;
@property (nonatomic, strong) id<BaseViewModelProtocol> headerViewModel;

@property (nonatomic, strong) NSString *footerTitle;
@property (nonatomic, strong) id<BaseViewModelProtocol> footerViewModel;

@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, assign) CGFloat footerHeight;

@property (nonatomic, strong) id<BaseViewModelProtocol> viewModel;
@property (nonatomic, strong) NSArray *cellViewModels;

@end
