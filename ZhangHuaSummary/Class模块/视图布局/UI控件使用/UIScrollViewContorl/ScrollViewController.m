//
//  ScrollViewController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/5/6.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *tempListArray = @[@"轮播图"];
    self.tableListArray = [tempListArray copy];
    NSArray *tempTitle  = @[@"ZHBannerLoop"];
    self.controllerTitle = [tempTitle copy];
    

    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
