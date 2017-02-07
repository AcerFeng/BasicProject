//
//  ViewProtocol.h
//  BasicProject
//
//  Created by LanFeng on 2017/2/8.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseViewModelProtocol;

@protocol ViewProtocol <NSObject>
- (instancetype)initWithViewModel:(id <BaseViewModelProtocol>)viewModel;

- (void)lf_bindViewModel;
- (void)lf_setupViews;
@end
