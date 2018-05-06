//
//  ZHWaveBtnView.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/5/6.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHWaveBtnView.h"

@implementation ZHWaveBtnView
- (void)drawRect:(CGRect)rect {
    
    //半径
    CGFloat redbius =_CGfrom_x/2;
    //开始角度
    CGFloat startAngle = 0;
    //中心点
    CGPoint point = CGPointMake(_CGfrom_x/2, _CGfrom_x/2);
    //结束角
    CGFloat endAngle = 2*M_PI;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:point radius:redbius startAngle:startAngle endAngle:endAngle clockwise:YES];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.path=path.CGPath;   //添加路径
    layer.strokeColor=[UIColor colorWithRed:0 green:191 blue:255 alpha:1.0].CGColor;
    layer.fillColor=[UIColor colorWithRed:0 green:191 blue:255 alpha:1.0].CGColor;
    [self.layer addSublayer:layer];
    
}

@end
