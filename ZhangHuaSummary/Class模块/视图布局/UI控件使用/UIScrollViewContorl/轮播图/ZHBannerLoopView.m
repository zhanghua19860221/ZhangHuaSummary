//
//  ZHBannerLoopView.m
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/8/28.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import "ZHBannerLoopView.h"

#define WIDTH  self.frame.size.width
#define HEIGHT self.frame.size.height

@interface ZHBannerLoopView ()<UIScrollViewDelegate>
@property(strong, nonatomic) UIScrollView  *  bannerScroll;//滚动视图
@property(strong, nonatomic) UIPageControl *  bannerPageControl;//分页指示控件
@property(strong, nonatomic) NSTimer       *  bannerTimer;  //轮播定时器
@property(assign, nonatomic) NSUInteger       pageCount ;   //记录总页面数
@property(assign, nonatomic) NSUInteger       CurrentPageCount ; //记录当前的页面
@property(assign, nonatomic) float            oldScrollOffset;   //记录之前Scroll偏移量
@end

@implementation ZHBannerLoopView

- (id)initWithFrame:(CGRect)frame;{
    self = [super initWithFrame:frame];
    if (self) {
        self.timerInterval= 2;
        self.pageCount = self.bannerArray.count;

        self.bannerScroll = [[UIScrollView alloc] init];
        [self addSubview:_bannerScroll];
        
        self.bannerPageControl = [[UIPageControl alloc] init];
        [self addSubview:_bannerPageControl];
 
    }
    return self;
}
-(void)layoutSubviews{
    
    _bannerScroll.frame = CGRectMake(0, 0,WIDTH,HEIGHT);
    _bannerScroll.contentSize = CGSizeMake((self.bannerArray.count+1)*WIDTH, 0);
    _bannerScroll.pagingEnabled = YES;
    _bannerScroll.delegate = self ;
    _bannerScroll.showsHorizontalScrollIndicator = NO ;

    for (int i = 0; i < self.bannerArray.count+1; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*WIDTH, 0, WIDTH, HEIGHT)];
        imageView.tag = 1000+i;
        imageView.userInteractionEnabled = YES;
        if (i == self.bannerArray.count) {
            imageView.image = [UIImage imageNamed:self.bannerArray[0]];
            
        }else{
            imageView.image = [UIImage imageNamed:self.bannerArray[i]];
        }
        [_bannerScroll addSubview:imageView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectHeaderImage:)];
        
        [imageView addGestureRecognizer:tap];
    }
    _bannerPageControl.frame = CGRectMake(0, HEIGHT-25, WIDTH, 25);
    _bannerPageControl.numberOfPages = self.pageCount;
    _bannerPageControl.currentPage = 0;
    _bannerPageControl.pageIndicatorTintColor = [UIColor orangeColor];
    _bannerPageControl.currentPageIndicatorTintColor = [UIColor redColor];
    
    //创建定时器
    [self creatTimer];
}
#pragma mark - 处理单击手势

-(void)selectHeaderImage:(UIGestureRecognizer *)sender{
    NSInteger index = sender.view.tag;
    [self.delegate click:index];
    
//    switch (index) {
//        case 1000:
//            NSLog(@"one");
//            break;
//        case 1001:
//            NSLog(@"two");
//            break;
//        case 1002:
//            NSLog(@"three");
//            break;
//        case 1003:
//            NSLog(@"four");
//            break;
//
//        default:
//            break;
//    }
   
}
- (void)creatTimer {
    
    self.bannerTimer = [NSTimer scheduledTimerWithTimeInterval:self.timerInterval
                                                        target:self
                                                      selector:@selector(changeScrollOffset)
                                                      userInfo:nil
                                                       repeats:YES];
    // 调整timer 的优先级
    NSRunLoop *mainLoop = [NSRunLoop mainRunLoop];
    [mainLoop addTimer:self.bannerTimer forMode:NSRunLoopCommonModes];
}
- (void)changeScrollOffset {
    [self.bannerScroll setContentOffset:CGPointMake((self.bannerPageControl.currentPage+1) * WIDTH, 0) animated:YES];
}
- (void)stopTimer{
    
    [self.bannerTimer invalidate];
    self.bannerTimer = nil;
}
#pragma  mark **************UIScrollViewDelegate*******************

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGPoint point = scrollView.contentOffset;
    BOOL isRight = self.oldScrollOffset < point.x;
    self.oldScrollOffset = point.x;
    // 调整pageControl的当前 位置
    if (point.x > WIDTH*(self.pageCount-1)+WIDTH*0.5 && !self.bannerTimer) {
        _bannerPageControl.currentPage = 0;
    }else if (point.x > WIDTH*(self.pageCount-1) && self.bannerTimer && isRight){
        _bannerPageControl.currentPage = 0;
    }else{
        _bannerPageControl.currentPage = (point.x+WIDTH*0.5)/ WIDTH;
    }
    
    //处理两种情况，1、当偏移量超出scrollView contentSize最大值时 2、当偏移量小于零时
    if (point.x >= WIDTH*self.pageCount) {
        
        [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
        
    }else if (point.x < 0) {
        
        [scrollView setContentOffset:CGPointMake(point.x+WIDTH*(self.pageCount), 0) animated:NO];
    }
}
/**
 手指开始拖动的时候, 就让计时器停止
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    [self stopTimer];
    
    self.bannerTimer = nil ;
}
/**
 手指离开屏幕的时候, 就让计时器开始工作
 */
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    [self creatTimer];
}
- (void)setBannerArray:(NSArray *)bannerArray{
    if (_bannerArray == nil) {
        _bannerArray = bannerArray;
    }
    self.pageCount = self.bannerArray.count;

    
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
