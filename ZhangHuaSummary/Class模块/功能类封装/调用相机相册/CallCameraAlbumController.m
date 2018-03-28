//
//  CallCameraAlbumController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/26.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "CallCameraAlbumController.h"

@interface CallCameraAlbumController ()

@end

@implementation CallCameraAlbumController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableListArray = @[@"调用相册",@"调用相册列表",@"调用相机",@"调用相机相册"];
    self.controllerTitle = @[@"ZHCallAlbumController",@"ZHAlbumListController",@"ZHCallCameraController",@"ZHCameraAlbumController"];

    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
