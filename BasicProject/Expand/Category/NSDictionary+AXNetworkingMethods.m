//
//  NSDictionary+AXNetworkingMethods.m
//  BasicProject
//
//  Created by lanfeng on 17/1/22.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "NSDictionary+AXNetworkingMethods.h"
#import "NSArray+AXNetworkingMethods.h"

@implementation NSDictionary (AXNetworkingMethods)
/** 字符串前面是没有问号的，如果用 POST，那就不用加问号，如果用 GET，就要加个问号 */
- (NSString *)AX_urlParamsStringSignature:(BOOL)isForSignature {
    NSArray *sortedArray = [self AX_transformedUrlParamsArraySignature:isForSignature];
    return [sortedArray AX_paramsString];
}
/** 字典变 json */
- (NSString *)AX_jsonString {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:NULL];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

- (NSArray *)AX_transformedUrlParamsArraySignature:(BOOL)isForSignature {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (![obj isKindOfClass:[NSString class]]) {
            obj = [NSString stringWithFormat:@"%@", obj];
        }
        if (!isForSignature) {
            obj = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)obj, NULL, (CFStringRef)@"!*'();:@&;=+$,/?%#[]", kCFStringEncodingUTF8));
        }
        if ([obj length] > 0) {
            [result addObject:[NSString stringWithFormat:@"%@=%@", key, obj]];
        }
    }];
    NSArray *sortedResult = [result sortedArrayUsingSelector:@selector(compare:)];
    return sortedResult;
}
@end
