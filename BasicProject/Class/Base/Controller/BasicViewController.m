//
//  BasicViewController.m
//  BasicProject
//
//  Created by lanfeng on 17/1/17.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()

@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)handleRouterParameters:(NSDictionary *)parameters {
    self.title = parameters[@"title"];
    return YES;
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
