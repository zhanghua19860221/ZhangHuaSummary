//
//  ZHProgressBarController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/14.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHProgressBarController.h"
#import "ZHWaterView.h"

@interface ZHProgressBarController ()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, weak) ZHWaterView *waterView;


@end

@implementation ZHProgressBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建控件
    [self creatControl];
    
    //添加定时器
    [self addTimer];
    
    self.view.backgroundColor = COLORFromRGB(0xffffff);

    // Do any additional setup after loading the view.
}
- (void)creatControl{
    //波浪
    ZHWaterView *waterView = [[ZHWaterView alloc] initWithFrame:CGRectMake(30, 100, 150, 150)];
    [self.view addSubview:waterView];
    [waterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(150);
        make.centerX.mas_equalTo(self.view.mas_centerX).offset(-SC_WIDTH/4.0);
        make.width.height.mas_equalTo(150);
    } ];
    
    self.waterView = waterView;
    
    //    //圆圈
    //    HWCircleView *circleView = [[HWCircleView alloc] initWithFrame:CGRectMake(220, 100, 150, 150)];
    //    [self.view addSubview:circleView];
    //    self.circleView = circleView;
    //
    //    //进度条
    //    HWProgressView *progressView = [[HWProgressView alloc] initWithFrame:CGRectMake(30, 365, 150, 20)];
    //    [self.view addSubview:progressView];
    //    self.progressView = progressView;
    //
    //    //加载安装效果
    //    HWInstallView *installView = [[HWInstallView alloc] initWithFrame:CGRectMake(220, 300, 150, 150)];
    //    [self.view addSubview:installView];
    //    self.installView = installView;
}

- (void)addTimer{
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.2f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)timerAction
{
    _waterView.progress += 0.01;
//    _circleView.progress += 0.01;
//    _progressView.progress += 0.01;
//    _installView.progress += 0.01;
    
    if (_waterView.progress >= 1) {
        [self removeTimer];
        NSLog(@"完成");
    }
}

- (void)removeTimer
{
    [_timer invalidate];
    _timer = nil;
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
