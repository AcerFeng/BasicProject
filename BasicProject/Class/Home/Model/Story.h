//
//  Story.h
//  BasicProject
//
//  Created by LanFeng on 2017/2/12.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Story : NSObject
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, assign) int type;

@property (nonatomic, strong) NSArray<NSString *> *images;

@property (nonatomic, strong) NSString *ga_prefix;
@end
