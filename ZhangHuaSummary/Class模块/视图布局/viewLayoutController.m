//
//  viewLayoutController.m
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/8/24.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import "viewLayoutController.h"

@interface viewLayoutController ()

@end

@implementation viewLayoutController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableViewData];
    // Do any additional setup after loading the view.
}
-(void)initTableViewData{
    
    self.tableListArray = @[@"选择器",@"UI使用",@"原生TabBarController",@"滑动菜单联动页面"];
    self.controllerTitle = @[@"ZHChooseController",@"UIControlController",@"RootController",@"ZHMenuController"];
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
