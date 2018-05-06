//
//  ZHCallTeleController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/22.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHCallTeleController.h"

@interface ZHCallTeleController ()

@end

@implementation ZHCallTeleController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self callTelePhone];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
- (void)callTelePhone{
    
    UILabel *teleLabelOne = [[UILabel alloc] init];
    teleLabelOne.text = @"轻触屏幕 拨通:13601112349";
    teleLabelOne.textAlignment = NSTextAlignmentCenter;
    teleLabelOne.font = [UIFont systemFontOfSize:16];
    [teleLabelOne setTextColor:COLORFromRGB(0x999999)];
    [self.view addSubview:teleLabelOne];
    [teleLabelOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(self.view.mas_width);
        make.height.mas_equalTo(16);
        
    }];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"13601112349"];
    UIWebView *callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
    
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
