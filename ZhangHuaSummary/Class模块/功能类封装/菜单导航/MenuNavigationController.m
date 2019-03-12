//
//  MenuNavigationController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2019/3/12.
//  Copyright © 2019年 zhanghua0221. All rights reserved.
//
#import "MenuNavigationController.h"
#import "ZHMenuView.h"

@interface MenuNavigationController ()<ZHMenuViewDelegate>{
    ZHMenuView *menuView;
}
@end

@implementation MenuNavigationController
- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = @[@"全部",@"待付款",@"待发货",@"待收货",@"待评价"];
    menuView = [[ZHMenuView alloc] initWithFrame:CGRectMake(0,200, [UIScreen mainScreen].bounds.size.width, 40) titleArray:array];
    menuView.backgroundColor = [UIColor whiteColor];
    //选中字体大小
    menuView.selectFont = 20;//默认15
    //默认字体大小
    menuView.defaultFont = 13;//默认13
    //选中字体颜色
    menuView.selectTextColor  = [UIColor brownColor];
    //默认字体颜色
    menuView.defaultTextColor = [UIColor grayColor];
    //是否显示底部滚动条
    menuView.isShowSlideLine = YES;//默认yes
    //滚动条颜色
    menuView.defaultSlideColor = [UIColor cyanColor];
    //是否显示间隔线
    menuView.isShowSpaceLine = YES;//默认yes
    //间隔线颜色
    menuView.defaultSpaceColor = [UIColor cyanColor];
    //设置滚动条 、按钮选中初始位置 默认为0
    menuView.currentIndex = 1;
    //滚动条是否为等宽 默认 YES （YES 等宽，NO 跟随字符串的长度变化）
    menuView.isEqualWidth = NO;
    
    //协议方法
    menuView.delegate = self;
    
    [self.view addSubview:menuView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点击跳转至（待发货）" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(100, 300,200 , 100);
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark ****************************** ZHMenuView协议代理方法 ******************************

-(void)changeSelectMenuIndex:(NSInteger)index isSelect:(BOOL)isSelect{
    NSLog(@"MenuIndex == %ld",index);
    
    
}
//设置当前选中按钮位置
-(void)click:(UIButton *)btn{
    [menuView updataSelectMenuIndex:2];
    
}
@end
