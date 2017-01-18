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

@interface HomeViewController ()

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
