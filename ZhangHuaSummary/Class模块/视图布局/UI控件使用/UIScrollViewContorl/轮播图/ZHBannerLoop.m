//
//  ZHBannerLoop.m
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/8/28.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import "ZHBannerLoop.h"
#import "ZHBannerLoopView.h"

@interface ZHBannerLoop ()<bannerDelegate>

@end

@implementation ZHBannerLoop

- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 11, *)) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        //iOS11 解决SafeArea的问题，同时能解决pop时上级页面scrollView抖动的问题
    }
    NSArray * array = @[@"banner_tp01@2x.png",@"banner_tp02@2x.png",@"banner_tp03@2x.png",@"banner_tp04@2x.png"];
    ZHBannerLoopView * view = [[ZHBannerLoopView alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, 266)];
    view.delegate = self;
    view.bannerArray = array;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    

    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.navigationBar.translucent = NO;
}
- (void)click:(NSInteger)index{
        switch (index) {
            case 1000:
                NSLog(@"one");
                break;
            case 1001:
                NSLog(@"two");
                break;
            case 1002:
                NSLog(@"three");
                break;
            case 1003:
                NSLog(@"four");
                break;
    
            default:
                break;
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
