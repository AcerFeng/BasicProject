//
//  HomeViewController.m
//  BasicProject
//
//  Created by lanfeng on 17/1/16.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "HomeViewController.h"
#import "MineViewController.h"
#import "Navigator.h"
#import "Router+TestModule.h"
#import "NewsViewModel.h"
#import "NewsTableViewCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "NewsListCellViewModel.h"
#import "TableViewSectionViewModel.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NewsViewModel *viewModel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIButton *jumpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    jumpButton.backgroundColor = [UIColor redColor];
    jumpButton.frame = CGRectMake(0, 0, 50, 20);
    
    [jumpButton setTitle:@"haha" forState:UIControlStateNormal];
    [jumpButton addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:jumpButton];

    [self.viewModel.refreshDataCommand execute:nil];
}

- (void)lf_bindViewModel {
    @weakify(self);
    [self.viewModel.refreshUI subscribeNext:^(id x) {
        @strongify(self);
        [self.tableView reloadData];
    }];
}

- (void)jump {
    [[Navigator sharedNavigator] navPushViewController:[[MineViewController alloc] init] animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIViewController *vc = [[Router sharedRouter] Router_testModuleViewController:@{@"test" : @"hello"}];
    
    [[Navigator sharedNavigator] navPushViewController:vc animated:YES];
    
    /* ------------------------ */
//    [[Router sharedRouter] CTMediator_showAlertWithMessage:@"测试一下" cancelAction:^(NSDictionary *info) {
//        NSLog(@"取消了");
//    } confirmAction:^(NSDictionary *info) {
//        //做你想做的事
//        NSLog(@"hahhahahaha");
//    }];
    
    /* ------------------------ */
    // 成功页
//    [[Router sharedRouter] CTMediator_presentImage:[UIImage imageNamed:@"1441594747553218"]];
    // 失败页
//    [[Router sharedRouter] CTMediator_presentImage:nil];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSectionViewModel *sectionViewModel = self.viewModel.newsList[indexPath.section];
    NewsListCellViewModel *viewModel = sectionViewModel.cellViewModels[indexPath.row];
    
    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([NewsTableViewCell class]) configuration:^(NewsTableViewCell *cell) {
        [cell lf_bindViewModel:viewModel];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.newsList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    TableViewSectionViewModel *sectionViewModel = self.viewModel.newsList[section];
    return sectionViewModel.cellViewModels.count;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSectionViewModel *sectionViewModel = self.viewModel.newsList[indexPath.section];
    NewsListCellViewModel *viewModel = sectionViewModel.cellViewModels[indexPath.row];
    
    NewsTableViewCell *newsCell = (NewsTableViewCell *)cell;
    [newsCell lf_bindViewModel:viewModel];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NewsTableViewCell class])];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([NewsTableViewCell class]) owner:nil options:nil].firstObject;
    }
    return cell;
}



#pragma mark - getters and setters

- (NewsViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[NewsViewModel alloc] init];
    }
    return _viewModel;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([NewsTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([NewsTableViewCell class])];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
