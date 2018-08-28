//
//  ProjectSummaryController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/8/10.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ProjectSummaryController.h"

@interface ProjectSummaryController ()

@end

@implementation ProjectSummaryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableListArray = @[@"获取网络ip地址",@"导航栏修改",@"状态栏修改"];
    self.controllerTitle = @[@"GetIpAddressController",@"GetIpAddressController",@"GetIpAddressController"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
