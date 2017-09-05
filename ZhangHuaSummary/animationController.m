//
//  animationController.m
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/8/24.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import "animationController.h"

@interface animationController ()

@end

@implementation animationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableViewData];
    // Do any additional setup after loading the view.
}
-(void)initTableViewData{
    
    self.tableListArray = @[@"购物车效果",@"抽屉效果"];
    self.controllerTitle = @[@"ZHShoppingCart",@"ZHDrawerRootController"];
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
