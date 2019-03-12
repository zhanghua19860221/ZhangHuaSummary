//
//  ZHMenuView.m
//  ZHMenuView
//
//  Created by 张华 on 2019/3/12.
//  Copyright © 2019年 张华. All rights reserved.

//滚动条的默认高度
#define zSlideHeight 2
//菜单按钮tag值
#define zMenuBtnStartTag 100

#import "ZHMenuView.h"

@interface ZHMenuView(){
    //按钮分割线
    UIImageView *spaceLine;
    //记录当前选中的按钮
    UIButton *selectMenuBtn;
}
/**
 菜单按钮下方线条
 
 */
@property (strong , nonatomic)UIImageView *slideLine;
/**
 菜单数组
 
 */
@property (strong , nonatomic)NSMutableArray *menu_array;
@end

@implementation ZHMenuView

/**
 懒加载

 @return 菜单数组
 */
- (NSMutableArray *)menu_array{
    if (_menu_array == nil) {
        _menu_array = [NSMutableArray arrayWithCapacity:4];
    }
    return _menu_array;
}

/**
 创建滚动条
 @return 返回滚动条
 */
-(UIImageView *)slideLine{
    CGFloat slideLineWidth = [self textWidthIndex:self.currentIndex];
    if (_slideLine == nil) {//显示滚动条
        CGFloat W = kSubWidth/_menu_array.count;
        //计算滚动条 X 坐标
        CGFloat X = self.currentIndex *W + (W-slideLineWidth)/2.0;
        _slideLine = [[UIImageView alloc] init];
        if (_isEqualWidth) {//等宽
            _slideLine.frame = CGRectMake(self.currentIndex *W, kSubHeight-zSlideHeight, W , zSlideHeight);

        }else{//跟随字符串的长度变化
            _slideLine.frame = CGRectMake(X, kSubHeight-zSlideHeight, slideLineWidth , zSlideHeight);

        }
        _slideLine.backgroundColor = _defaultSlideColor;
    }
    return _slideLine;
}

/**
 初始化

 @param rect 控件大小
 @param titles 菜单内容数组
 @return self
 */
- (id)initWithFrame:(CGRect)rect titleArray:(NSArray*)titles{
    self = [super initWithFrame:rect];
    if (self) {
        //获取菜单数据
        [self.menu_array addObjectsFromArray:titles];
        selectMenuBtn = nil;
        [self prepareData];
    }
    return self;
}

/**
 用户未设置情况下 默认数据设置
 */
-(void)prepareData{
    self.defaultFont = W(13);
    self.defaultTextColor = COLORFromRGB(0x4c4c4c);
    self.defaultSlideColor = COLORFromRGB(0xe10000);
    self.defaultSpaceColor = COLORFromRGB(0x969696);
    self.selectFont = W(15);
    self.selectTextColor = COLORFromRGB(0xe10000);
    
    self.isShowSlideLine = YES;
    self.isShowSpaceLine = YES;
    
    self.currentIndex = 0;
    self.isEqualWidth = YES;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    int i = zMenuBtnStartTag;
    for (NSString *title in _menu_array) {
        //确保多次调用layoutSubviews 时 ，按钮不被重复创建，当（_slideLine ！= nil）时说明已经创建过按钮
        if (_slideLine == nil) {
            //title 按钮文字 btnTag按钮tag值
            [self creatButtonWithTitle:title btnTag:i++];
        }
    }
    //是否创建滚动条
    if (_isShowSlideLine) {
        [self addSubview:self.slideLine];
    }
}

/**
 创建菜单栏

 @param title 按钮文字
 @param tag 按钮tag
 */
-(void)creatButtonWithTitle:(NSString *)title btnTag:(int)tag{
    //宽
    CGFloat W = kSubWidth/_menu_array.count;
    //高
    CGFloat H = kSubHeight;
    int index = tag-100;
    NSLog(@"index === %d",index);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:_defaultTextColor forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:_defaultFont];
    //默认选中第一个按钮
    if (self.currentIndex == index && selectMenuBtn == nil) {
        btn.selected = YES;
        selectMenuBtn = btn;
        btn.titleLabel.font = [UIFont systemFontOfSize:_selectFont];
        [btn setTitleColor:_selectTextColor forState:UIControlStateSelected];
    }
    btn.tag = tag;
    btn.frame = CGRectMake(index*W, 0, W, H);
    [btn addTarget:self action:@selector(selectMenuIndex:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    //是否创建菜单间隔线
    if (_isShowSpaceLine) {
        if (_menu_array.count >= 2 && index<_menu_array.count) {//最少有两个 按钮才可以创建  在与 （数组个数 -1） 相等时停止创建
            spaceLine = [[UIImageView alloc] init];
            spaceLine.backgroundColor = _defaultSpaceColor;
            spaceLine.frame = CGRectMake((index+1)*W,H*0.2, 1, H*0.6);
            [self addSubview:spaceLine];
        }
    }

}
/**
 点击事件

 @param btn 选中按钮
 */
-(void)selectMenuIndex:(UIButton *)btn{
    btn.selected = !btn.selected;
    BOOL selected = btn.selected;
    if (selectMenuBtn != btn) {//选中了不同按钮
        selectMenuBtn.selected = NO;
        //恢复未选中状态
        [selectMenuBtn setTitleColor:_defaultTextColor forState:UIControlStateNormal];
        selectMenuBtn.titleLabel.font = [UIFont systemFontOfSize:_defaultFont];
        btn.selected = YES;
        selectMenuBtn = btn;
        CGFloat W = kSubWidth/_menu_array.count;
        CGFloat index = btn.tag - zMenuBtnStartTag;
        kWeakSelf(self);
        [UIView animateWithDuration:0.2 animations:^{
            kStrongSelf(self);
            CGFloat slideLineWidth = [self textWidthIndex:index];
            if (self.isEqualWidth) {//等宽
                self.slideLine.frame = CGRectMake(index *W, kSubHeight-zSlideHeight, W , zSlideHeight);
                
            }else{//跟随字符串的长度变化
                //计算滚动条 X 坐标
                CGFloat X = index *W + (W-slideLineWidth)/2.0;
                self.slideLine.frame = CGRectMake(X, kSubHeight-zSlideHeight, slideLineWidth , zSlideHeight);
                
            }
        }];
        //设置选中状态
        selectMenuBtn.titleLabel.font = [UIFont systemFontOfSize:_selectFont];
        [selectMenuBtn setTitleColor:_selectTextColor forState:UIControlStateSelected];
        //调用协议方法 传递参数
        [self.delegate changeSelectMenuIndex:index isSelect:selected];
    }else{//选中了相同按钮
        CGFloat index = btn.tag - zMenuBtnStartTag;
        [selectMenuBtn setTitleColor:_selectTextColor forState:UIControlStateSelected];
        [selectMenuBtn setTitleColor:_selectTextColor forState:UIControlStateNormal];
        //调用协议方法 传递参数
        [self.delegate changeSelectMenuIndex:index isSelect:selected];
    }
}
/**
 进入页面指定滚动到 哪一个menu
 
 @param index  指定按钮索引
 */
-(void)updataSelectMenuIndex:(NSInteger)index{
    //修改对应 button 的选中状态
    NSInteger tag = index + zMenuBtnStartTag;
    UIButton *tempBtn = [self viewWithTag:tag];
    if (selectMenuBtn != tempBtn) {
        selectMenuBtn.selected = NO;
        //恢复未选中状态
        [selectMenuBtn setTitleColor:_defaultTextColor forState:UIControlStateNormal];
        selectMenuBtn.titleLabel.font = [UIFont systemFontOfSize:_defaultFont];
        tempBtn.selected = YES;
        selectMenuBtn = tempBtn;
        //设置选中状态
        selectMenuBtn.titleLabel.font = [UIFont systemFontOfSize:_selectFont];
        [selectMenuBtn setTitleColor:_selectTextColor forState:UIControlStateSelected];
        //修改滚动条的相应位置
        CGFloat W = kSubWidth/_menu_array.count;
        kWeakSelf(self);
        [UIView animateWithDuration:0.2 animations:^{
            kStrongSelf(self);
            CGFloat slideLineWidth = [self textWidthIndex:index];
            if (self.isEqualWidth) {//等宽
                self.slideLine.frame = CGRectMake(index *W, kSubHeight-zSlideHeight, W , zSlideHeight);
                
            }else{//跟随字符串的长度变化
                //计算滚动条 X 坐标
                CGFloat X = index *W + (W-slideLineWidth)/2.0;
                self.slideLine.frame = CGRectMake(X, kSubHeight-zSlideHeight, slideLineWidth , zSlideHeight);
                
            }
        }];
    }
}
/** 是否显示底部滚动条 */
- (void)setIsShowSlideLine:(BOOL)isShowSlideLine{
    if (_isShowSlideLine != isShowSlideLine) {
        _isShowSlideLine = isShowSlideLine;
    }
}

/** 是否显示分割线 */
- (void)setIsShowSpaceLine:(BOOL)isShowSpaceLine{
    if (_isShowSpaceLine != isShowSpaceLine) {
        _isShowSpaceLine = isShowSpaceLine;
    }
    
}
/** 设置默认字体大小 */
- (void)setDefaultFont:(CGFloat)defaultFont{
    if (_defaultFont != defaultFont) {
        _defaultFont = defaultFont;
    }
}
/** 设置选中字体大小 */
- (void)setSelectFont:(CGFloat)selectFont{
    if (_selectFont != selectFont) {
        _selectFont = selectFont;
    }
}
/** 设置默认字体颜色 */
- (void)setDefaultTextColor:(UIColor *)defaultTextColor{
    if (_defaultTextColor != defaultTextColor) {
        _defaultTextColor = defaultTextColor;
    }
}
/** 设置选中字体颜色 */
- (void)setSelectTextColor:(UIColor *)selectTextColor{
    if (_selectTextColor != selectTextColor) {
        _selectTextColor = selectTextColor;
    }
}
/** 设置默认滚动条颜色 */
- (void)setDefaultSlideColor:(UIColor *)defaultSlideColor{
    if (_defaultSlideColor != defaultSlideColor) {
        _defaultSlideColor = defaultSlideColor;
    }
    
}

/** 设置默认分割线颜色 */
- (void)setDefaultSpaceColor:(UIColor *)defaultSpaceColor{
    if (_defaultSpaceColor != defaultSpaceColor) {
        _defaultSpaceColor = defaultSpaceColor;
    }
    
}
/** 计算字符串宽度 */
- (CGFloat)textWidthIndex:(NSInteger )index{
    NSString *contentText = self.menu_array[index];
    CGRect rect = [contentText boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:_selectFont]} context:nil];
    
    return rect.size.width+1;
}
@end
