//
//  LatestNews.h
//  BasicProject
//
//  Created by lanfeng on 17/2/3.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Story;
@class TopStory;
@interface LatestNews : NSObject
@property (nonatomic, strong) NSString *date;

@property (nonatomic, strong) NSArray<Story *> *stories;
@property (nonatomic, strong) NSArray<TopStory *> *top_stories;
@end
