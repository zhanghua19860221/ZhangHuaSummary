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
    self.tableListArray = @[@"调用摄像头",@"图片缓存处理",@"视频播放处理",@"二维码扫描支付"];
    self.controllerTitle = @[@"ZHCameraCall",@"ZHPictureCache",@"ZHAVPlayerClass",@"ZHQRCodePay"];
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
