//
//  ProjectOptimizationController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/8/28.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ProjectOptimizationController.h"

@interface ProjectOptimizationController ()

@end

@implementation ProjectOptimizationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableListArray = @[@"优化模块",@"优化总结"];
    self.controllerTitle = @[@"OptimizationModuleController",@"OptimizationSummaryController"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
