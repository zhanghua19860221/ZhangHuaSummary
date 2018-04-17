//
//  ZHCountdownBtnController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/26.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHCountdownBtnController.h"
#import "UIButton+ZHCountDown.h"

@interface ZHCountdownBtnController ()

@end

@implementation ZHCountdownBtnController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self  createSubviewBtn];
    // Do any additional setup after loading the view.
}
- (void)createSubviewBtn{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = COLORFromRGB(0xe10000);
    [button setTitleColor:COLORFromRGB(0xffffff) forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius  = 3;
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    [button setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.height.mas_equalTo(H(40));
        make.width.mas_equalTo(W(140));
        
        
    }];

    
}
/**
 获取验证码
 */
- (void)click:(UIButton*)btn{
    [btn startCountDownTime:60 withCountDownBlock:^{
        NSLog(@"此处书写按钮点击事件");

    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
