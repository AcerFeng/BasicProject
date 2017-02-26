//
//  NewsListCellViewModel.m
//  BasicProject
//
//  Created by lanfeng on 17/2/13.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "NewsListCellViewModel.h"
#import "Story.h"

@interface NewsListCellViewModel ()
@property (nonatomic, strong, readwrite) Story *model;
@end

@implementation NewsListCellViewModel
- (instancetype)initWithModel:(Story *)model {
    self = [super initWithModel:model];
    if (self) {
        _model = model;
        
        self.ID = model.ID;
        self.title = model.title;
        self.type = model.type;
        self.images = model.images;
        self.ga_prefex = model.ga_prefix;
    }
    return self;
}

- (void)lf_initialize {
    
}

@end
