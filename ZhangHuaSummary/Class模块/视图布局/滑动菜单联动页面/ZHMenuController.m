//
//  ZHMenuController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/13.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHMenuController.h"
//(路径 - Class模块->功能封装->菜单导航)
#import "ZHMenuView.h"
#import "FirstController.h"
#import "SecondeController.h"
#import "ThirdController.h"
#import "FourController.h"
#import "FiveController.h"
#import "SixController.h"

#define menuHeight 40 //菜单栏高度

@interface ZHMenuController ()<UIScrollViewDelegate,ZHMenuViewDelegate>

@property (strong , nonatomic)UIScrollView *scrollView;//子控制器视图
@property (strong , nonatomic)ZHMenuView *menuView;//菜单视图
@property (strong , nonatomic)NSMutableArray *titleArray;//菜单标题数组

@end

@implementation ZHMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createMenuView];
    [self addSubViewController];
    self.view.backgroundColor = COLORFromRGB(0xffffff);
    // Do any additional setup after loading the view.
}



/**
 创建菜单栏
 */
- (void)createMenuView{
    
    NSArray *array = @[@"全部",@"充值",@"提现",@"投资",@"回款",@"收益"];
    [self.titleArray addObjectsFromArray:array];
    
    _menuView = [[ZHMenuView alloc] initWithFrame:CGRectMake(0,kNavAndStatusHeight, kScreenWidth, menuHeight) titleArray:self.titleArray];
    _menuView.backgroundColor = [UIColor whiteColor];
    //选中字体大小
    //_menuView.selectFont = 20;//默认15
    //默认字体大小
    //_menuView.defaultFont = 13;//默认13
    //选中字体颜色
    //_menuView.selectTextColor  = [UIColor brownColor];
    //默认字体颜色
    //_menuView.defaultTextColor = [UIColor grayColor];
    //是否显示底部滚动条
    //_menuView.isShowSlideLine = YES;//默认yes
    //滚动条颜色
    //_menuView.defaultSlideColor = [UIColor cyanColor];
    //是否显示间隔线
    //_menuView.isShowSpaceLine = YES;//默认yes
    //间隔线颜色
    //_menuView.defaultSpaceColor = [UIColor cyanColor];
    //设置滚动条 、按钮选中初始位置 默认为0
    //_menuView.currentIndex = 1;
    //滚动条是否为等宽 默认 YES （YES 等宽，NO 跟随字符串的长度变化）
    //_menuView.isEqualWidth = NO;
    //协议方法
    _menuView.delegate = self;
    
    [self.view addSubview:_menuView];

    
}
//ScrollView添加子控制器

- (void)addSubViewController{
    
    FirstController *first = [[FirstController alloc]  init];
    SecondeController *seconde = [[SecondeController alloc] init];
    ThirdController *third = [[ThirdController alloc] init];
    FourController *four = [[FourController alloc] init];
    FiveController *five = [[FiveController alloc] init];
    SixController *six = [[SixController alloc] init];
    
    [self addChildViewController:first];
    [self addChildViewController:seconde];
    [self addChildViewController:third];
    [self addChildViewController:four];
    [self addChildViewController:five];
    [self addChildViewController:six];
    
    
    for (int i=0; i<self.titleArray.count; i++) {
        UIViewController *vc = self.childViewControllers[i];
        vc.view.backgroundColor =  randomColor;
        vc.view.frame= CGRectMake(kScreenWidth*i, 0, kScreenWidth, self.scrollView.frame.size.height);
        [self.scrollView addSubview:vc.view];
    }

}

//UIScrollView懒加载

-(UIScrollView *)scrollView{
    if (_scrollView == nil) {
        
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self ;
        _scrollView.bounces = NO;
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.contentSize = CGSizeMake(kScreenWidth*self.titleArray.count, 0);
        [self.view addSubview:self.scrollView];
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_menuView.mas_bottom);
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.height.mas_equalTo(kScreenHeight-kNavAndStatusHeight-menuHeight);
            
        }];
    }
    return _scrollView;
}

/**
 懒加载数组
 */

- (NSMutableArray *)titleArray{
    if (nil == _titleArray) {
        _titleArray = [NSMutableArray arrayWithCapacity:4];
    }
    return _titleArray;
}
#pragma ******************UIScrollViewDelegate*********************************

//scrollView滚动时，就调用该方法。任何offset值改变都调用该方法。即滚动过程中，调用多次
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScroll");
    if (scrollView == _scrollView){//因为tableview 中的scrollView 也使用同一代理，所以要判断，否则取得x值不是预期的
        CGPoint point=scrollView.contentOffset;
        int index = point.x/kScreenWidth;
        [_menuView updataSelectMenuIndex:index];

    }
}
// 当开始滚动视图时，执行该方法。一次有效滑动（开始滑动，滑动一小段距离，只要手指不松开，只算一次滑动），只执行一次。
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    NSLog(@"scrollViewWillBeginDragging");
    
}

// 滑动scrollView，并且手指离开时执行。一次有效滑动，只执行一次。
// 当pagingEnabled属性为YES时，不调用，该方法
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    NSLog(@"scrollViewWillEndDragging");
    
}

// 滚动视图减速完成，滚动将停止时，调用该方法。一次有效滑动，只执行一次。
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSLog(@"scrollViewDidEndDecelerating");
    
    
}

#pragma *****************ZHMenuViewDelegate*****************************

-(void)changeSelectMenuIndex:(NSInteger)index  isSelect:(BOOL)isSelect{
    self.scrollView.contentOffset = CGPointMake(index*kScreenWidth, 0);

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
