//
//  FirstBarController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/22.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "FirstBarController.h"

@interface FirstBarController ()

@end

@implementation FirstBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createButton];
    // Do any additional setup after loading the view.
}
- (void)createButton{
    UIButton *hiden = [UIButton buttonWithType:UIButtonTypeCustom];
    [hiden setTitle:@"点击隐藏操作栏" forState:UIControlStateNormal];
    [hiden setTitleColor:COLORFromRGB(0xe10000) forState:UIControlStateNormal];
    [self.view addSubview:hiden];
    [hiden addTarget:self action:@selector(hidenClick:) forControlEvents:UIControlEventTouchUpInside];
    [hiden mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(-30);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(40);
        
    }];
    
    UIButton *show = [UIButton buttonWithType:UIButtonTypeCustom];
    [show setTitle:@"点击显示操作栏" forState:UIControlStateNormal];
    [show setTitleColor:COLORFromRGB(0xe10000) forState:UIControlStateNormal];

    [self.view addSubview:show];
    [show addTarget:self action:@selector(showClick:) forControlEvents:UIControlEventTouchUpInside];
    [show mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(10);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(40);
        
    }];
    
}
- (void)hidenClick:(UIButton *)btn{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"removeTabBar" object:nil userInfo:@{@"color":@"1",@"title":@"1"}];
    
}
- (void)showClick:(UIButton *)btn{
    //    //展示tabBar
    [[NSNotificationCenter defaultCenter] postNotificationName:@"showTabBar" object:nil userInfo:@{@"color":@"1",@"title":@"1"}];
    
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
