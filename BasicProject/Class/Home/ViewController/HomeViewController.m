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
#import "NewsAPIRequest.h"
#import "NewsReformer.h"
#import "LatestNews.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NewsAPIRequest *newsAPIRequest;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    
    UIButton *jumpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    jumpButton.backgroundColor = [UIColor redColor];
    jumpButton.frame = CGRectMake(0, 0, 50, 20);
    
    [jumpButton setTitle:@"haha" forState:UIControlStateNormal];
    [jumpButton addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:jumpButton];
    
    [self.newsAPIRequest startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
//        NSLog(@"%@",request.responseJSONObject);
//        NSLog(@"%@", NSStringFromClass([request.responseJSONObject class]));
        LatestNews *news = [self.newsAPIRequest fetchDataWithReformer:[[NewsReformer alloc] init]];
        NSLog(@"%@", news);
//        [request.responseJSONObject writeToFile:@"/Users/lanfeng/Desktop/test.plist" atomically:YES];
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"请求失败！");
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
    
    return 44;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - getters and setters
- (NewsAPIRequest *)newsAPIRequest {
    if (!_newsAPIRequest) {
        _newsAPIRequest = [[NewsAPIRequest alloc] init];
        
    }
    return _newsAPIRequest;
}

@end
