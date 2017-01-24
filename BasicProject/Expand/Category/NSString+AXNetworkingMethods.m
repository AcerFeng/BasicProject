//
//  NSString+AXNetworkingMethods.m
//  BasicProject
//
//  Created by lanfeng on 17/1/23.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "NSString+AXNetworkingMethods.h"
#include <CommonCrypto/CommonDigest.h>
//#import "NSObject+AXNetworkingMethods.h"

@implementation NSString (AXNetworkingMethods)
- (NSString *)AX_md5 {
    NSData* inputData = [self dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char outputData[CC_MD5_DIGEST_LENGTH];
    CC_MD5([inputData bytes], (unsigned int)[inputData length], outputData);
    
    NSMutableString* hashStr = [NSMutableString string];
    int i = 0;
    for (i = 0; i < CC_MD5_DIGEST_LENGTH; ++i)
        [hashStr appendFormat:@"%02x", outputData[i]];
    
    return hashStr;
}
@end
