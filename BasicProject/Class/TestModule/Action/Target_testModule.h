//
//  Target_testModule.h
//  BasicProject
//
//  Created by lanfeng on 17/1/17.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestModuleViewController.h"

@interface Target_testModule : NSObject
- (TestModuleViewController *)Action_testModuleViewController:(NSDictionary *)parameters;

- (id)Action_showAlert:(NSDictionary *)params;


- (id)Action_nativePresentImage:(NSDictionary *)params;
// 容错
- (id)Action_nativeNoImage:(NSDictionary *)params;
@end
