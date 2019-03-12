//
//  NativeAndH5InteractiveController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2019/3/5.
//  Copyright © 2019年 zhanghua0221. All rights reserved.
//

#import "NativeAndH5InteractiveController.h"

@interface NativeAndH5InteractiveController ()

@end

@implementation NativeAndH5InteractiveController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.backgroundColor = [UIColor grayColor].CGColor;
    self.tableListArray = @[@"UIWebView",@"WKWebView"];
    self.controllerTitle = @[@"UIWebViewController",@"WKWebViewController"];

}

@end
