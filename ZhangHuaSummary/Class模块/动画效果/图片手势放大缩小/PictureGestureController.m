//
//  PictureGestureController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/5/16.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "PictureGestureController.h"
static CGRect oldframe;//用于记录按钮放大之前的frame

@interface PictureGestureController ()<UIScrollViewDelegate>{
    NSArray *imagesArray;//存储图片
    CATransition *animation;//缩放动画效果
    CGFloat scaleNum;//图片放大倍数
    UIButton *selectBtn;//记录选择的是那张图片的btn;
}
@property(nonatomic,strong)UIScrollView *scrollview;//用于捏合放大与缩小的scrollView
@property(nonatomic,strong)UIImageView *imageView;//用于捏合放大与缩小的scrollView

@end

@implementation PictureGestureController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLORFromRGB(0xffffff);
    [self createSubview];
    // Do any additional setup after loading the view.
}
- (void)createSubview{
    CGFloat Wid = (SC_WIDTH - W(40))/3.0;
    CGFloat height = H(80);
    CGFloat space = W(10);
    
    imagesArray = @[@"mid.jpg",@"right.jpg",@"leftImage.jpg",@"banner_tp01.png",@"banner_tp02.png",@"banner_tp03.png",@"banner_tp04.png"];
    
    for (int i =0; i<imagesArray.count; i++) {
        NSString *imgStr = [imagesArray objectAtIndex:i];
        
        UIImage *img= [UIImage imageNamed:imgStr];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake((i%3+1)*space + i%3*Wid,H(100) + i/3*height + i/3*(H(10)) , Wid,height);
        button.tag = 100+i;
        [button setImage:img forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(enlargeImage:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
    }
}
- (void)enlargeImage:(UIButton *)btn{
    scaleNum=1;
    oldframe = btn.frame;
    selectBtn = btn;
    NSInteger index = btn.tag - 100;
    NSLog(@"index =%ld" , index);
    
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    UIView *backgroundView=[[UIView alloc]initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    backgroundView.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.8];
    [window addSubview:backgroundView];
    
    
    //添加捏合手势，放大与缩小图片
    self.scrollview=[[UIScrollView alloc]initWithFrame:backgroundView.bounds];
    [backgroundView addSubview:self.scrollview];
    self.scrollview.delegate = self;
    self.imageView = [[UIImageView alloc] initWithFrame:self.scrollview.bounds];
    self.imageView.alpha = 0 ;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.imageView setImage:[UIImage imageNamed:imagesArray[index]]];
    [self.scrollview addSubview:self.imageView];
    
    
    //设置UIScrollView的滚动范围和图片的真实尺寸一致
    
    self.scrollview.contentSize=self.imageView.frame.size;
    
    //设置实现缩放
    
    //设置代理scrollview的代理对象
    
    self.scrollview.delegate=self;
    
    //设置最大伸缩比例
    
    self.scrollview.maximumZoomScale=3;
    
    //设置最小伸缩比例
    
    self.scrollview.minimumZoomScale=1;
    
    [self.scrollview setZoomScale:1 animated:NO];
    
    self.scrollview.scrollsToTop =NO;
    self.scrollview.scrollEnabled =YES;
    self.scrollview.showsHorizontalScrollIndicator=NO;
    
    self.scrollview.showsVerticalScrollIndicator=NO;
    
    
    //单击手势
    
    UITapGestureRecognizer *singleTapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleTap:)];
    
    singleTapGesture.numberOfTapsRequired = 1;
    
    singleTapGesture.numberOfTouchesRequired  =1;
    
    [backgroundView addGestureRecognizer:singleTapGesture];
    
    
    
    //双击手势
    
    UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleDoubleTap:)];
    
    doubleTapGesture.numberOfTapsRequired = 2;
    
    doubleTapGesture.numberOfTouchesRequired =1;
    
    [backgroundView addGestureRecognizer:doubleTapGesture];
    
    [singleTapGesture requireGestureRecognizerToFail:doubleTapGesture];
    
    
    [UIView animateWithDuration:0.6 animations:^{
        self.imageView.alpha = 1 ;
        
    } completion:^(BOOL finished) {
        selectBtn.userInteractionEnabled=NO;
        
    }];
    
}

#pragma mark - 还原图片

-(void)hideImage:(UITapGestureRecognizer*)tap{
    
    UIView *backgroundView=tap.view;
    
    animation = [CATransition animation];
    
    animation.duration =0.2;
    
    animation.fillMode =kCAFillModeForwards;
    
    animation.type =kCATransition;
    
    backgroundView.alpha=0;
    
    [backgroundView.layer addAnimation:animation forKey:@"animation"];
    
    selectBtn.userInteractionEnabled=YES;
    
}

#pragma mark - 处理单击手势

-(void)handleSingleTap:(UIGestureRecognizer *)sender{
    
    UITapGestureRecognizer *tap=(UITapGestureRecognizer *)sender;
    
    [self hideImage:tap];
    
}

#pragma mark - 处理双击手势

-(void)handleDoubleTap:(UIGestureRecognizer *)sender{
    
    if (scaleNum>=1&&scaleNum<=2) {
        
        scaleNum++;
        
    }else{
        
        scaleNum=1;
        
    }
    
    [self.scrollview setZoomScale:scaleNum animated:YES];
}


#pragma mark - UIScrollViewDelegate,告诉scrollview要缩放的是哪个子控件

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    return self.imageView;
    
}
#pragma mark - 等比例放大，让放大的图片保持在scrollView的中央

- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    
    CGFloat offsetX = (self.scrollview.bounds.size.width > self.scrollview.contentSize.width)?(self.scrollview.bounds.size.width - self.scrollview.contentSize.width) *0.5 : 0.0;
    
    CGFloat offsetY = (self.scrollview.bounds.size.height > self.scrollview.contentSize.height)?
    
    (self.scrollview.bounds.size.height - self.scrollview.contentSize.height) *0.5 : 0.0;
    
    self.imageView.center =CGPointMake(self.scrollview.contentSize.width *0.5 + offsetX,self.scrollview.contentSize.height *0.5 + offsetY);
    
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
