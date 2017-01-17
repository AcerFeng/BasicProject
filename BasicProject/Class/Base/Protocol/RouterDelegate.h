//
//  RouterDelegate.h
//  BasicProject
//
//  Created by lanfeng on 17/1/17.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RouterDelegate <NSObject>

- (BOOL)handleRouterParameters:(NSDictionary *)parameters;

@end
