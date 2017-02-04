//
//  BaseViewModel.m
//  BasicProject
//
//  Created by lanfeng on 17/2/4.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    BaseViewModel *viewModel = [super allocWithZone:zone];
    
    if (viewModel) {
        [viewModel lf_initialize];
    }
    return viewModel;
}

- (instancetype)initWithModel:(id)model {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)lf_initialize {
    
}
@end
