//
//  toolClassEncap.m
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/8/24.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import "toolClassEncap.h"

@interface toolClassEncap ()

@end

@implementation toolClassEncap

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableListArray = @[@"下拉菜单",@"视图渐变色",@"贝塞尔曲线",@"图形验证码",@"网络请求封装",@"视频播放处理",@"拨打电话功能",@"文本阅读功能",@"图片处理功能",@"调取相机相册",@"开发设计模式",@"二维码扫描支付"];
    self.controllerTitle = @[@"DropDownMenuController",@"ChangeColorController",@"ZHBezierPathController",@"PatternCordController",@"ZHCustomAFNController",@"ZHAVPlayerClass",@"ZHCallTeleController",@"ZHReadTextController",@"PictureManageController",@"CallCameraAlbumController",@"DevelopmentController",@"ZHQRCodePay"];
    // Do any additional setup after loading the view.
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
