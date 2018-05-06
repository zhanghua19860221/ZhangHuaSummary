//
//  WaveBtnController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/5/6.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "WaveBtnController.h"

@interface WaveBtnController ()

@end

@implementation WaveBtnController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableListArray = @[@"默认开启",@"点击开启"];
    self.controllerTitle = @[@"StaticDisplayController",@"RunDisplayController"];
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
