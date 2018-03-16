//
//  ZHWaveController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/16.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHWaveController.h"
#import "ZHWaveView.h"
#import "ZHWaveTwoView.h"
@interface ZHWaveController ()

@end

@implementation ZHWaveController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZHWaveView *waveView = [[ZHWaveView alloc] init];
    [self.view addSubview:waveView];
    [waveView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(150);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(40);
        
    }];
    
    ZHWaveTwoView *waveTwoView = [[ZHWaveTwoView alloc] init];
    [self.view addSubview:waveTwoView];
    [waveTwoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(waveView.mas_bottom).offset(50);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(80);
        
    }];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
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
