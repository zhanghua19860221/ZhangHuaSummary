//
//  ZHBannerLoop.m
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/8/28.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import "ZHBannerLoop.h"
#import "ZHBannerLoopView.h"

@interface ZHBannerLoop ()

@end

@implementation ZHBannerLoop

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray * array = @[@"banner_tp01@2x.png",@"banner_tp02@2x.png",@"banner_tp03@2x.png",@"banner_tp04@2x.png"];
    ZHBannerLoopView * view = [[ZHBannerLoopView alloc]initWithFrame:CGRectMake(0, 100,self.view.frame.size.width, 266) :array];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
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
