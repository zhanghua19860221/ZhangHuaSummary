//
//  UIWebViewController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2019/3/5.
//  Copyright © 2019年 zhanghua0221. All rights reserved.
//

#import "UIWebViewController.h"

@interface UIWebViewController ()

@end

@implementation UIWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.backgroundColor = [UIColor grayColor].CGColor;

    self.tableListArray = @[@"H5调取原生",@"原生调取H5"];
    self.controllerTitle = @[@"UIWebH5ToNativeController",@"UIWebNativeToH5Controller"];
}

@end
