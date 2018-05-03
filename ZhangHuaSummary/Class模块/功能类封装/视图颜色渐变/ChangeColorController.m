//
//  ChangeColorController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/4/28.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ChangeColorController.h"

@interface ChangeColorController ()

@end

@implementation ChangeColorController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLORFromRGB(0xffffff);
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 200)];
    [self.view addSubview:view];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    //设置三个色带的分割线
    gradientLayer.locations = @[@0.3, @0.5, @1.0];
    //设置渐变色的起点和终点
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 1.0);
    gradientLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    [view.layer addSublayer:gradientLayer];
    
    UIView *viewOne = [[UIView alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 200)];
    [self.view addSubview:viewOne];
    CAGradientLayer *gradientLayerOne = [CAGradientLayer layer];
    gradientLayerOne.colors = @[(__bridge id)COLORFromRGB(0xe10000).CGColor,(__bridge id)COLORFromRGB(0xff7d63).CGColor];
    gradientLayerOne.locations = @[@0.25, @1.0];
    gradientLayerOne.startPoint = CGPointMake(0, 0);
    gradientLayerOne.endPoint = CGPointMake(1, 1);
    gradientLayerOne.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    [viewOne.layer addSublayer:gradientLayerOne];
    
    UIView *viewTwo = [[UIView alloc] initWithFrame:CGRectMake(0, 520, self.view.frame.size.width, 80)];
    [self.view addSubview:viewTwo];
    CAGradientLayer *gradientLayerTwo = [CAGradientLayer layer];
    gradientLayerTwo.colors = @[(__bridge id)COLORFromRGB(0xe999999).CGColor,(__bridge id)COLORFromRGB(0xff7d63).CGColor];
    gradientLayerTwo.locations = @[@0.5];
    gradientLayerTwo.startPoint = CGPointMake(0, 0);
    gradientLayerTwo.endPoint = CGPointMake(1, 0);
    gradientLayerTwo.frame = CGRectMake(0, 0, self.view.frame.size.width, 100);
    [viewTwo.layer addSublayer:gradientLayerTwo];
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
