//
//  ZHTextFileController.m
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/9/5.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import "ZHTextFileController.h"

@interface ZHTextFileController ()

@end

@implementation ZHTextFileController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableViewData];

    // Do any additional setup after loading the view.
}
-(void)initTableViewData{
    
    self.tableListArray = @[@"知识总结",@"文字样式设置",@"旅游攻略"];
    self.controllerTitle = @[@"ZHSummaryController",@"ZHTextStyleController",@"ZHTravelStrategyController"];
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
