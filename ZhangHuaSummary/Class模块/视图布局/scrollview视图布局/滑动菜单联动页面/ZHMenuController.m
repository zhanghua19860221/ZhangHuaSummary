//
//  ZHMenuController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/13.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHMenuController.h"
#import "ZHMenuView.h"
@interface ZHMenuController ()

@end

@implementation ZHMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createMenuView];
    self.view.backgroundColor = COLORFromRGB(0xffffff);
    // Do any additional setup after loading the view.
}

/**
 创建菜单栏
 */
- (void)createMenuView{
    ZHMenuView *view = [[ZHMenuView alloc] initWithFrame:CGRectMake(0, StatusHeight+44, SC_WIDTH, 40)];
    [self.view addSubview:view];
    
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
