//
//  UIDevice+IdentifierAddition.h
//  BasicProject
//
//  Created by lanfeng on 17/1/23.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (IdentifierAddition)
- (NSString *)LF_uuid;
- (NSString *)LF_udid;
- (NSString *)LF_macaddress;
- (NSString *)LF_macaddressMD5;
- (NSString *)LF_ostype;//显示“ios6，ios5”，只显示大版本号
- (NSString *)LF_createUUID;
@end
