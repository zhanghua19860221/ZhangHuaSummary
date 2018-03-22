//
//  ZHMaskView.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/21.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHMaskView.h"
//获取屏幕宽高
#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height


@implementation ZHMaskView
- (id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)layoutSubviews{
    CGFloat x = WIDTH/4.0;
    CGFloat y = HEIGHT/2.0 - WIDTH/4.0 ;
    CGFloat w = WIDTH/2.0;
    CGFloat h = WIDTH/2.0;
    
    CAShapeLayer* cropLayer = [[CAShapeLayer alloc] init];
    [self.layer addSublayer:cropLayer];
    // 创建一个绘制路径
    CGMutablePathRef path =CGPathCreateMutable();
    // 空心矩形的rect
    CGRect cropRect = CGRectMake(x, y, w, h);
    // 绘制rect
    CGPathAddRect(path, nil, self.bounds);
    CGPathAddRect(path, nil, cropRect);
    // 设置填充规则(重点)
    [cropLayer setFillRule:kCAFillRuleEvenOdd];
    // 关联绘制的path
    [cropLayer setPath:path];
    // 设置填充的颜色
    [cropLayer setFillColor:[[UIColor cyanColor] colorWithAlphaComponent:0.7].CGColor];
    //手动释放绘图路径 不然会造成内存泄露
    CGPathRelease(path);
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
