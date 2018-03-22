//
//  ZHMenuView.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/13.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#define zMenuBtnStartTag 100
#define WIDTH  self.frame.size.width
#define HEIGHT self.frame.size.height
#define zSlideHeight 2

#import "ZHMenuView.h"
@interface ZHMenuView()
{
    UIImageView *z_SlideLine;//菜单按钮下方线条
    UIButton *selectMenuBtn;//记录当前选中的按钮
    
}
@property (strong , nonatomic)NSArray *menu_array;
@end

@implementation ZHMenuView
- (id)initTitleArray:(NSArray*)titles{
    self = [super init];
    if (self) {
        _menu_array = titles;
        NSLog(@"%@",_menu_array[0]);
        selectMenuBtn = nil;
    }
    return self;
}
//
-(void)layoutSubviews{
    self.backgroundColor = COLORFromRGB(0xf9f9f9);
    
    int i = zMenuBtnStartTag;
    
    for (NSString *title in _menu_array) {
        [self creatButtonWithTitle:title andIndex:i++ isShowSeparator:YES];
    }
    
    [self createSlideLine:YES];
    
    
}
//创建下方联动线条

- (void)createSlideLine:(BOOL)showSilde{
    CGFloat W = WIDTH/_menu_array.count;
    CGFloat WLine = W*0.7;
    CGFloat XLine = W*0.15;
    if (showSilde) {
        z_SlideLine = [[UIImageView alloc] init];
        z_SlideLine.frame = CGRectMake(XLine, HEIGHT-zSlideHeight, WLine , zSlideHeight);
        z_SlideLine.backgroundColor = [UIColor redColor];
        [self addSubview:z_SlideLine];
        
    }
    
}
//创建菜单栏

-(void)creatButtonWithTitle:(NSString *)title andIndex:(int)tag isShowSeparator:(BOOL)showSeparator{
    
    //创建菜单按钮
    CGFloat W = WIDTH/_menu_array.count;
    CGFloat H = HEIGHT;
    int index = tag-100;
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    if (index == 0) {
        btn.selected = YES;
        selectMenuBtn = btn;
    }
    [btn setTitleColor:COLORFromRGB(0x333333) forState:UIControlStateNormal];
    [btn setTitleColor:COLORFromRGB(0xe10000) forState:UIControlStateSelected];
    btn.tag = tag;
    btn.frame = CGRectMake(index*W, 0, W, H);
    [btn addTarget:self action:@selector(selectMenuIndex:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
    //创建菜单间隔线
    if (_menu_array.count >= 2 && showSeparator && index<_menu_array.count) {
        
        UIImageView *spaceLine = [[UIImageView alloc] init];
        spaceLine.backgroundColor = [UIColor orangeColor];
        spaceLine.frame = CGRectMake((index+1)*W,H*0.2, 1, H*0.6);
        [self addSubview:spaceLine];
        
    }
    
}
//Menu点击事件
-(void)selectMenuIndex:(UIButton *)btn{
    
    if (selectMenuBtn != btn) {
        selectMenuBtn.selected = NO;
        btn.selected = YES;
        selectMenuBtn = btn;
    }
    
    CGFloat W = WIDTH/_menu_array.count;
    CGFloat WLine = W*0.7;
    CGFloat XLine = W*0.15;
    CGFloat index = btn.tag - zMenuBtnStartTag;
    
    [UIView animateWithDuration:0.2 animations:^{
        z_SlideLine.frame = CGRectMake(XLine+(W*index), HEIGHT-zSlideHeight, WLine , zSlideHeight);
        
    }];
    [self.delegate changeSelectMenuIndex:index];

}
-(void)updataSelectMenuIndex:(NSInteger)index{
    
    CGFloat W = WIDTH/_menu_array.count;
    CGFloat WLine = W*0.7;
    CGFloat XLine = W*0.15;
    
    [UIView animateWithDuration:0.2 animations:^{
        z_SlideLine.frame = CGRectMake(XLine+(W*index), HEIGHT-zSlideHeight, WLine , zSlideHeight);
        
    }];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
