//
//  ZHWaveTwoView.m
//  ZHWaterWaveDemo
//
//  Created by 张华 on 2018/3/16.
//  Copyright © 2018年 张华. All rights reserved.
//

#import "ZHWaveTwoView.h"
@interface ZHWaveTwoView()

@property (assign , nonatomic)CGFloat offsetX;
@property (assign , nonatomic)CGFloat offsetXT;
@property (assign , nonatomic)CGFloat waveSpeed;
@property (assign , nonatomic)CGFloat waveWidth;
@property (assign , nonatomic)CGFloat waveHeight;
@property (assign , nonatomic)CGFloat waveAmplitude;

@property (strong , nonatomic)CAShapeLayer *waveShapeLayer;
@property (strong , nonatomic)CAShapeLayer *waveShapeLayerT;
@property (strong , nonatomic)CADisplayLink *waveDisplayLink;
@property (strong , nonatomic)UIColor *waveColor;

@end

@implementation ZHWaveTwoView
-(id)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.masksToBounds  = YES;
        
    }
    return self;
}
-(void)drawRect:(CGRect)rect{

    //控制波速度
    self.waveSpeed = 5;
    //控制波宽度
    self.waveWidth = self.frame.size.width;
    //控制波高度
    self.waveHeight = self.frame.size.height/2.0;
    //调整波的上下波动幅度
    self.waveAmplitude = 20;
    
    [self wave];
    
}
- (void)wave {
    /*
     *创建两个layer
     */
    self.waveShapeLayer = [CAShapeLayer layer];
    UIColor *waveColor0ne = [UIColor colorWithRed:0/255.0 green:50/255.0 blue:255/255.0 alpha:0.1f];
    self.waveShapeLayer.fillColor = waveColor0ne.CGColor;
    self.waveShapeLayer.lineWidth = 4.0;
    self.waveShapeLayer.strokeStart = 0.0;
    self.waveShapeLayer.strokeEnd = 0.8;
    [self.layer addSublayer:self.waveShapeLayer];
    
    self.waveShapeLayerT = [CAShapeLayer layer];
    UIColor *waveColorTwo = [UIColor colorWithRed:0/255.0 green:191/255.0 blue:255/255.0 alpha:0.1f];
    self.waveShapeLayerT.fillColor = waveColorTwo.CGColor;
    self.waveShapeLayerT.lineWidth = 4.0;
    self.waveShapeLayerT.strokeStart = 0.0;
    self.waveShapeLayerT.strokeEnd = 0.8;
    [self.layer addSublayer:self.waveShapeLayerT];

    self.waveDisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave)];
    [self.waveDisplayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}
//CADispayLink相当于一个定时器 会一直绘制曲线波纹 看似在运动，其实是一直在绘画不同位置点的余弦函数曲线
- (void)getCurrentWave {
    
    //offsetX决定x位置，如果想搞明白可以多试几次
    self.offsetX += self.waveSpeed;
    //声明第一条波曲线的路径
    CGMutablePathRef path = CGPathCreateMutable();
    //设置起始点
    CGPathMoveToPoint(path, nil, 0, self.waveHeight);
    
    CGFloat y = 0.f;
    //第一个波纹的公式
    for (float x = 0.f; x <= self.waveWidth ; x++) {
        y = self.waveAmplitude * sin((300 / self.waveWidth) * (x * M_PI / 180) - self.offsetX * M_PI / 270) + self.waveHeight*1;
        CGPathAddLineToPoint(path, nil, x, y);
        x++;
    }
    //把绘图信息添加到路径里
    CGPathAddLineToPoint(path, nil, self.waveWidth, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    //结束绘图信息
    CGPathCloseSubpath(path);
    self.waveShapeLayer.path = path;
    //释放绘图路径
    CGPathRelease(path);
    
    /*
     *  第二个
     */
    self.offsetXT += self.waveSpeed;
    
    CGMutablePathRef pathT = CGPathCreateMutable();
    CGPathMoveToPoint(pathT, nil, 0, self.waveHeight);
    
    CGFloat yT = 0.f;
    for (float x = 0.f; x <= self.waveWidth ; x++) {
        yT = self.waveAmplitude * sin((300 / self.waveWidth) * (x * M_PI / 180) - self.offsetXT * M_PI / 200) + self.waveHeight;
        CGPathAddLineToPoint(pathT, nil, x, yT);
    }
    CGPathAddLineToPoint(pathT, nil, self.waveWidth, self.frame.size.height);
    CGPathAddLineToPoint(pathT, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(pathT);

    self.waveShapeLayerT.path = pathT;
    CGPathRelease(pathT);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
