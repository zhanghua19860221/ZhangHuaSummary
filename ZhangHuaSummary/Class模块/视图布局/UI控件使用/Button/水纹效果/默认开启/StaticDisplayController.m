//
//  StaticDisplayController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/5/6.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "StaticDisplayController.h"
#import "ZHWaveBtnView.h"

#define Wwidth [UIScreen mainScreen].bounds.size.width
#define Hheight [UIScreen mainScreen].bounds.size.height

#define shipeiHeight [UIScreen mainScreen].bounds.size.height/667.0
#define shipeiWidth [UIScreen mainScreen].bounds.size.width/375.0

//iphone X 尺寸
#define ZHheight ([[UIApplication sharedApplication] statusBarFrame].size.height >20? 86:64)  //导航栏高度
#define IphoneXHeight ([[UIApplication sharedApplication] statusBarFrame].size.height >20? 22:0)  //导航栏增加高度
#define IphoneXTabbarH ([[UIApplication sharedApplication] statusBarFrame].size.height >20? 83:49)  //tabbar高度

@interface StaticDisplayController (){
    UIButton * _RegisterBtn;
    NSTimer *_timer;
}

@end

@implementation StaticDisplayController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];

    _timer = [NSTimer scheduledTimerWithTimeInterval:0.7 target:self selector:@selector(clickAnimation) userInfo:nil repeats:YES];
    
    _RegisterBtn = [[UIButton alloc]initWithFrame:CGRectMake(Wwidth*.5 - 50*shipeiWidth,300 , 100*shipeiWidth, 100*shipeiWidth)];
    [self.view addSubview:_RegisterBtn];
    
    _RegisterBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _RegisterBtn.titleLabel.font = [UIFont systemFontOfSize:17.0];
    _RegisterBtn.titleLabel.numberOfLines = 0;
    [_RegisterBtn setTitleColor:[UIColor redColor] forState:0];
    [_RegisterBtn setTitle:@"展示水纹效果" forState:0];
    _RegisterBtn.backgroundColor = [UIColor greenColor];
    
    _RegisterBtn.layer.masksToBounds = NO;
    _RegisterBtn.layer.cornerRadius = 50*shipeiWidth;
    _RegisterBtn.layer.borderWidth = 5*shipeiWidth;
    _RegisterBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    
    _RegisterBtn.layer.shadowOffset =  CGSizeMake(0, 0);
    _RegisterBtn.layer.shadowOpacity = 0.6;
    _RegisterBtn.layer.shadowColor =  [UIColor blackColor].CGColor;
    
    [_RegisterBtn addTarget:self action:@selector(clickAnimation2) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

-(void)clickAnimation{
    
    __block ZHWaveBtnView *waveView = [[ZHWaveBtnView alloc] initWithFrame:_RegisterBtn.frame];
    waveView.CGfrom_x = _RegisterBtn.bounds.size.width;
    waveView.backgroundColor = [UIColor clearColor];
    waveView.alpha = 1;
    waveView.tag = 10001;
    [self.view addSubview:waveView];
    [self.view sendSubviewToBack:waveView];
    [UIView animateWithDuration:1 animations:^{
        waveView.transform = CGAffineTransformScale(waveView.transform, 2, 2);
        waveView.alpha = 0;
    } completion:^(BOOL finished) {
        [waveView removeFromSuperview];
        NSLog(@"结束动画");
    }];
}

//点击关闭
-(void)clickAnimation2{
    //    //关闭定时器
    [UIView animateWithDuration:0.5 animations:^{
        [_timer setFireDate:[NSDate distantFuture]];
        //取消定时器
        [_timer invalidate];
        _timer = nil;
        
    } completion:^(BOOL finished) {
        //for循环查找:
        for (UIView *findLabel in self.view.subviews) {
            if (findLabel.tag == 10001)
            {
                [findLabel removeFromSuperview ];
            }
        }
        NSLog(@"结束动画");
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
