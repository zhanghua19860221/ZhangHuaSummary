//
//  SwitchViewController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/26.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "SwitchViewController.h"

@interface SwitchViewController ()

@end

@implementation SwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initSubView];
    // Do any additional setup after loading the view.
}
- (void)initSubView{
    
    UISwitch *switchView = [[UISwitch alloc] init];
    switchView.on = YES;//默认开关打开
    switchView.onTintColor = COLORFromRGB(0xe10000);//开关背景色
    [switchView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];// 开关事件切换通知
    [self.view addSubview:switchView];
    [switchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(20);
        
    }];
}
-(void)switchAction:(id)sender{
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    if (isButtonOn) {
        //打开开关
        NSLog(@"打开开关");

    }else {
        //关闭开关
        NSLog(@"关闭开关");
        
    }
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
