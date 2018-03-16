//
//  ZHLoadingViewController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/14.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHLoadingViewController.h"
#import "ZHLoadingView.h"
@interface ZHLoadingViewController ()
@property (strong , nonatomic)ZHLoadingView *z_loadingView;

@end

@implementation ZHLoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadingView];
    self.view.backgroundColor = COLORFromRGB(0xffffff);

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)loadingView{
    if (_z_loadingView == nil) {
        
        _z_loadingView = [[ZHLoadingView alloc] init];
        [self.view addSubview:_z_loadingView];
        //设置菊花颜色
        _z_loadingView.progressView.color = COLORFromRGB(0xe10000);
        
        //设置菊花大小缩放比例
        CGAffineTransform transform  = CGAffineTransformMakeScale(1.0f , 1.0f);
        _z_loadingView.progressView.transform = transform;
        
        //设置菊花下方文字
        _z_loadingView.titleLabel.text = @"加载中...";
        
        //设置菊花下方文字颜色
        [_z_loadingView.titleLabel setTextColor:COLORFromRGB(0xe10000)];
        
        
        [_z_loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.height.width.mas_equalTo(100);
        }];
        [self.view bringSubviewToFront:_z_loadingView];
        
    }
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
