//
//  Router+TestModule.h
//  BasicProject
//
//  Created by lanfeng on 17/1/17.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "Router.h"

// 在此类中建议只做与本模块（testModule）相关的操作，不建议做其他操作，比如像（CTMediator 中操作 tableviewController 的方法，应该再创建一个 router 分类来针对其控制器做对应操作，当然那其实只是个演示）
@interface Router (TestModule)
// 最常用的操作
- (UIViewController *)Router_testModuleViewController:(NSDictionary *)parameters;


- (void)CTMediator_showAlertWithMessage:(NSString *)message cancelAction:(void(^)(NSDictionary *info))cancelAction confirmAction:(void(^)(NSDictionary *info))confirmAction;

- (void)CTMediator_presentImage:(UIImage *)image;

@end
