//
//  NSArray+AXNetworkingMethods.m
//  BasicProject
//
//  Created by lanfeng on 17/1/22.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "NSArray+AXNetworkingMethods.h"

@implementation NSArray (AXNetworkingMethods)

/** 字母排序之后形成的参数字符串 */
- (NSString *)AX_paramsString {
    NSMutableString *paramString = [[NSMutableString alloc] init];
    
    NSArray *sortedParams = [self sortedArrayUsingSelector:@selector(compare:)];
    [sortedParams enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([paramString length] == 0) {
            [paramString appendFormat:@"%@", obj];
        } else {
            [paramString appendFormat:@"&%@", obj];
        }
    }];
    
    return paramString;
}

/** 数组变 json */
- (NSString *)AX_jsonString {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:NULL];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
