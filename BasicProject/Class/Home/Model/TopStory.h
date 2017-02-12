//
//  TopStory.h
//  BasicProject
//
//  Created by LanFeng on 2017/2/12.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopStory : NSObject
@property (nonatomic, strong) NSNumber *ID;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *image;

@property (nonatomic, assign) int type;

@property (nonatomic, strong) NSString *ga_prefix;
@end
