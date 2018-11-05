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
@interface ZHMenuView(){
    UIImageView *slideLine;//菜单按钮下方线条
    UIImageView *spaceLine;
    UIButton *selectMenuBtn;//记录当前选中的按钮
    
}
@property (strong , nonatomic)NSArray *menu_array;
@end

@implementation ZHMenuView
- (id)initWithFrame:(CGRect)rect titleArray:(NSArray*)titles{
    self = [super initWithFrame:rect];
    if (self) {
        _menu_array = titles;
        selectMenuBtn = nil;
        [self createSubview];
    }
    return self;
}
-(void)createSubview{
    self.backgroundColor = COLORFromRGB(0xffffff);
    int i = zMenuBtnStartTag;
    for (NSString *title in _menu_array) {
        [self creatButtonWithTitle:title andIndex:i++];
    }
    [self createSlideLine];

}
//创建下方联动线条
- (void)createSlideLine{
    CGFloat W = WIDTH/_menu_array.count;
    NSString *str = _menu_array[0];
    CGFloat slideW =  [self labelWidthText:str textFont:W(14)];
    CGFloat slideX = (W - slideW)/2.0;
    slideLine = [[UIImageView alloc] init];
    slideLine.frame = CGRectMake(slideX, HEIGHT-zSlideHeight, slideW , zSlideHeight);
    slideLine.backgroundColor = [UIColor redColor];
    [self addSubview:slideLine];

}
//创建菜单栏

-(void)creatButtonWithTitle:(NSString *)title andIndex:(int)tag{
    
    //创建菜单按钮
    CGFloat W = WIDTH/_menu_array.count;
    CGFloat H = HEIGHT;
    int index = tag-100;
    NSLog(@"index === %d",index);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    if (index == 0) {
        btn.selected = YES;
        selectMenuBtn = btn;
    }
    [btn setTitleColor:COLORFromRGB(0x333333) forState:UIControlStateNormal];
    [btn setTitleColor:COLORFromRGB(0xe10000) forState:UIControlStateSelected];
    btn.tag = tag;
    btn.titleLabel.font = [UIFont systemFontOfSize:W(14)];
    btn.frame = CGRectMake(index*W, 0, W, H);
    [btn addTarget:self action:@selector(selectMenuIndex:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];

    //创建菜单间隔线
    if (_menu_array.count >= 2 && index<_menu_array.count-1) {
        spaceLine = [[UIImageView alloc] init];
        spaceLine.backgroundColor = COLORFromRGB(0x666666);
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
        
        CGFloat W = WIDTH/_menu_array.count;
        CGFloat index = btn.tag - zMenuBtnStartTag;
        
        NSString *str = btn.titleLabel.text;
        CGFloat slideW =  [self labelWidthText:str textFont:W(14)];
        CGFloat slideX = (W - slideW)/2.0 ;
        [UIView animateWithDuration:0.2 animations:^{
            slideLine.frame = CGRectMake(slideX+(W*index), HEIGHT-zSlideHeight, slideW , zSlideHeight);
        }];
        [self.delegate changeSelectMenuIndex:index];
    }
}

-(void)updataSelectMenuIndex:(NSInteger)index{
    //修改对应 button 的选中状态
      NSInteger tag = index + zMenuBtnStartTag;
      UIButton *tempBtn = [self viewWithTag:tag];
    
      if (selectMenuBtn != tempBtn) {
         selectMenuBtn.selected = NO;
         tempBtn.selected = YES;
         selectMenuBtn = tempBtn;
          //修改滚动条的相应位置
          CGFloat W = WIDTH/_menu_array.count;
          NSString *str = selectMenuBtn.titleLabel.text;
          CGFloat slideW =  [self labelWidthText:str textFont:W(14)];
          CGFloat slideX = (W - slideW)/2.0 ;
          
          [UIView animateWithDuration:0.2 animations:^{
              slideLine.frame = CGRectMake(slideX+(W*index), HEIGHT-zSlideHeight, slideW , zSlideHeight);
          }];
     }
}
/** 计算字符串宽度 */
- (CGFloat)labelWidthText:(NSString * ) text textFont:(float) font{
    
    CGRect rect = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil];
    
    return rect.size.width+1;
}
/** 是否显示底部滚动条 */
- (void)setIsShowSlideLine:(BOOL)isShowSlideLine{
    if (!isShowSlideLine) {
        slideLine.hidden = YES;
    }
}

/** 是否显示分割线 */
- (void)setIsShowSpaceLine:(BOOL)isShowSpaceLine{
    if (!isShowSpaceLine) {
        spaceLine.hidden = YES;
        
    }
}
/** 设置选中按钮的字体大小 */
- (void)setSelectFont:(CGFloat)selectFont{
    selectMenuBtn.titleLabel.font = [UIFont systemFontOfSize:selectFont];

}
/** 设置选中按钮的字体颜色 */
- (void)setSelectColor:(UIColor *)selectColor{
    selectMenuBtn.titleLabel.textColor = selectColor;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
