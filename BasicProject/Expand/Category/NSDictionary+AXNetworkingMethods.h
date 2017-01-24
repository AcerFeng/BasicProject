//
//  NSDictionary+AXNetworkingMethods.h
//  BasicProject
//
//  Created by lanfeng on 17/1/22.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (AXNetworkingMethods)
- (NSString *)AX_urlParamsStringSignature:(BOOL)isForSignature;
- (NSString *)AX_jsonString;
- (NSArray *)AX_transformedUrlParamsArraySignature:(BOOL)isForSignature;
@end
