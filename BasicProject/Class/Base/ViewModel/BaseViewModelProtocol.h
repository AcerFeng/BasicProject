//
//  BaseViewModelProtocol.h
//  BasicProject
//
//  Created by LanFeng on 2017/2/6.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseViewModelProtocol <NSObject>
@optional

- (instancetype)initWithModel:(id)model;

/**
 *  初始化
 */
- (void)lf_initialize;
@end
