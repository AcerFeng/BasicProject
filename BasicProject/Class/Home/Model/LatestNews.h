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

@interface Story : NSObject
@property (nonatomic, strong) NSNumber *ID;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, assign) int type;

@property (nonatomic, strong) NSArray<NSString *> *images;

@property (nonatomic, strong) NSString *ga_prefix;
@end

@interface TopStory : NSObject
@property (nonatomic, strong) NSNumber *ID;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *image;

@property (nonatomic, assign) int type;

@property (nonatomic, strong) NSString *ga_prefix;
@end
