//
//  LFUDIDGenerator.h
//  BasicProject
//
//  Created by lanfeng on 17/1/24.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFUDIDGenerator : NSObject

+ (id)sharedInstance;

- (NSString *)UDID;
- (void)saveUDID:(NSString *)udid;
@end
