//
//  ButtonViewController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/26.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ButtonViewController.h"

@interface ButtonViewController ()

@end

@implementation ButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableViewData];
    self.view.backgroundColor = [UIColor whiteColor];
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)initTableViewData{
    
    self.tableListArray = @[@"倒计时按钮",@"开关按钮",@"图形验证码"];
    self.controllerTitle = @[@"ZHCountdownBtnController",@"SwitchViewController",@"PatternCordController"];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
