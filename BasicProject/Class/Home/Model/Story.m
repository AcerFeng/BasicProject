//
//  Story.m
//  BasicProject
//
//  Created by LanFeng on 2017/2/12.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "Story.h"
#import "MJExtension.h"

@implementation Story
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ID" : @"id"
             };
}

@end
