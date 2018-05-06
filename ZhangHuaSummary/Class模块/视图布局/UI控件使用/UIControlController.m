//
//  UIControlController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/5/6.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "UIControlController.h"

@interface UIControlController ()

@end

@implementation UIControlController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableListArray = @[@"Button",@"ScrollView",@"TableView",@"CollectionView"];
    self.controllerTitle = @[@"ButtonViewController",@"ScrollViewController",@"TableViewController",@"CollectionViewController"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
