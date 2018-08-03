//
//  ZHChooseController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/16.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHChooseController.h"

@interface ZHChooseController ()

@end

@implementation ZHChooseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableListArray = @[@"银行选择",@"城市选择",@"分享选择视图",@"日历选择器"];
    self.controllerTitle = @[@"ZHChooseBankController",@"ZHChooseCityController",@"ShareChooseController",@"DatePickViewController"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
