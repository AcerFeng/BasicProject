//
//  TableViewSectionViewModel.m
//  BasicProject
//
//  Created by LanFeng on 2017/2/25.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "TableViewSectionViewModel.h"

@implementation TableViewSectionViewModel
- (instancetype)init {
    self = [super init];
    if (self) {
        self.headerHeight = UITableViewAutomaticDimension;
        self.footerHeight = UITableViewAutomaticDimension;
        
    }
    return self;
}
@end
