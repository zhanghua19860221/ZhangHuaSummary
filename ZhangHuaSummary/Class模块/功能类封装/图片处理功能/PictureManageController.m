//
//  PictureManageController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/23.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "PictureManageController.h"

@interface PictureManageController ()

@end

@implementation PictureManageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableListArray = @[@"图片缓存处理",@"图片压缩"];
    self.controllerTitle = @[@"ZHPictureCache",@"PictureCompressionController"];
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
