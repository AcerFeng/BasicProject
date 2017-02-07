//
//  BaseView.m
//  BasicProject
//
//  Created by LanFeng on 2017/2/8.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self lf_setupViews];
        [self lf_bindViewModel];
    }
    return self;
}

- (instancetype)initWithViewModel:(id <BaseViewModelProtocol>)viewModel {
    self = [super init];
    if (self) {
        [self lf_setupViews];
        [self lf_bindViewModel];
    }
    return self;
}

- (void)lf_bindViewModel {}
- (void)lf_setupViews {}

@end
