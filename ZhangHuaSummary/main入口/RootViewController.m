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
    [self addTitle];
    [self initTableViewData];
    // Do any additional setup after loading the view.
    
}
-(void)addTitle{
    self.title = @"提纲";
}
-(void)initTableViewData{
    NSArray *tempListArray = @[@"视图布局",@"动画效果",@"文本文件",@"功能类封装",@"数据加密存储",@"Button(按钮)",@"基本功能汇总"];
    self.tableListArray = [tempListArray copy];
    NSArray *tempTitle  = @[@"viewLayoutController",@"animationController",@"ZHTextFileController",@"toolClassEncap",@"ZHEncryptDataController",@"ButtonViewController",@"BasicsFundationController"];
    self.controllerTitle = [tempTitle copy];
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
