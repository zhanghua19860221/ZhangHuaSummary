//
//  RootViewController.m
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/8/23.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetTitle];
    [self initTableViewData];
    // Do any additional setup after loading the view.
    
}
-(void)SetTitle{
    self.title = @"提纲";
}
-(void)initTableViewData{
    self.tableListArray = @[@"视图布局",@"动画效果",@"文本文件",@"工具类封装"];
    self.controllerTitle = @[@"viewLayoutController",@"animationController",@"ZHTextFileController",@"toolClassEncap"];
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
