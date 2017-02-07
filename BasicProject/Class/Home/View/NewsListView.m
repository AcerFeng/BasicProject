//
//  NewsListView.m
//  BasicProject
//
//  Created by LanFeng on 2017/2/8.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "NewsListView.h"
#import "NewsViewModel.h"

@interface NewsListView ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *newsTableView;
@property (nonatomic, strong) NewsViewModel *viewModel;
@end

@implementation NewsListView

- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel {
    self.viewModel = (NewsViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

#pragma mark - private methods
- (void)lf_setupViews {
    [self addSubview:self.newsTableView];
}

- (void)lf_bindViewModel {
    
}

#pragma mark - getters and setters
- (UITableView *)newsTableView {
    if (!_newsTableView) {
        _newsTableView = [[UITableView alloc] init];
        _newsTableView.dataSource = self;
        _newsTableView.delegate = self;
    }
    return _newsTableView;
}

@end
