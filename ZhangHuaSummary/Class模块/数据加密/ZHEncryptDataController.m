//
//  ZHEncryptDataController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/2/22.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHEncryptDataController.h"

@interface ZHEncryptDataController ()

@end

@implementation ZHEncryptDataController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableViewData];

}
-(void)initTableViewData{
    
    self.tableListArray = @[@"RSA",@"MD5"];
    self.controllerTitle = @[@"ZHRsaController",@"ZHMD5Controller"];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
