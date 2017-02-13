//
//  LatestNews.h
//  BasicProject
//
//  Created by lanfeng on 17/2/3.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Story;
@interface LatestNews : NSObject
@property (nonatomic, strong) NSString *date;

@property (nonatomic, strong) NSArray<Story *> *stories;
@end
