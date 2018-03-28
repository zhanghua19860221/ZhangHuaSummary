//
//  ShowStateInfoController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/28.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ShowStateInfoController.h"

@interface ShowStateInfoController ()

@end

@implementation ShowStateInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLORFromRGB(0xffffff);
    [self createInfoView];
    // Do any additional setup after loading the view.
}
- (void)createInfoView{
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.backgroundColor = [COLORFromRGB(0xe10000) colorWithAlphaComponent:0.5];
    [addButton setTitle:@"点击展示信息" forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(showInfo) forControlEvents:UIControlEventTouchUpInside];
    addButton.layer.masksToBounds = YES;
    addButton.layer.cornerRadius  = 3;
    addButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:addButton];
    [addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.height.mas_equalTo(40/SCALE_Y);
        make.width.mas_equalTo(140/SCALE_X);
        
        
    }];
    
}
-(void)showInfo{
    
    NSString *str =  [NSString stringWithFormat:@"%d",arc4random_uniform(100)];
    [self createShowView:str];
    
}
- (void)createShowView:(NSString *)str{
    
    UIView *promptBox = [[UIView alloc] init];
    
    [[UIApplication sharedApplication].keyWindow addSubview:promptBox];
    [UIView animateWithDuration:1 animations:^{
        
        promptBox.backgroundColor = randomColor;
        promptBox.layer.cornerRadius = 8;
        promptBox.layer.masksToBounds = YES;
        [promptBox mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo([UIApplication sharedApplication].keyWindow.mas_centerX);
            make.centerY.equalTo([UIApplication sharedApplication].keyWindow.mas_centerY).offset(50);
            make.width.mas_equalTo(160);
            make.height.mas_equalTo(40);
            
        }];
        UILabel*lable = [[UILabel alloc] init];
        lable.textAlignment = NSTextAlignmentCenter;
        lable.text = str;
        [lable setTextColor:COLORFromRGB(0xe10000)];
        lable.font = [UIFont boldSystemFontOfSize:16];
        [promptBox addSubview:lable];
        [lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(promptBox);
            make.centerY.equalTo(promptBox.mas_centerY);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(16);
            
        }];
        
    } completion:^(BOOL finished) {
        
        [promptBox removeFromSuperview];
        
    }];
    
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
