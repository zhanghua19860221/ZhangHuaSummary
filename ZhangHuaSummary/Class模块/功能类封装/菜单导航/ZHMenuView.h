//
//  ZHMenuView.h
//  ZHMenuView
//
//  Created by 张华 on 2019/3/12.
//  Copyright © 2019年 张华. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol  ZHMenuViewDelegate<NSObject>
/**
 (@required)必须要实现的协议方法 (@optional)此方法修饰协议方法可以不实现
 
 */
@required

/**
 协议方法
 @param index 当前点击按钮 索引
 @param isSelect 当前按钮是否选中
 */
- (void)changeSelectMenuIndex:(NSInteger)index  isSelect:(BOOL)isSelect;

@end

@interface ZHMenuView : UIView
- (id)initWithFrame:(CGRect)rect titleArray:(NSArray*)titles;
/**
 代理属性*/
@property (weak, nonatomic) id<ZHMenuViewDelegate>delegate;
/**
 当前滚动条位置 选中按钮索引*/
@property (assign ,nonatomic)NSInteger currentIndex;
/**
 设置 当前滚动条位置 选中按钮索引*/
- (void)updataSelectMenuIndex:(NSInteger)index;
/**
 默认字体大小*/
@property (assign ,nonatomic)CGFloat defaultFont;
/**
 选中字体大小*/
@property (assign ,nonatomic)CGFloat selectFont;
/**
 默认字体颜色*/
@property (strong ,nonatomic)UIColor *defaultTextColor;
/**
 选中字体颜色*/
@property (strong ,nonatomic)UIColor *selectTextColor;
/**
 是否显示分割线*/
@property (assign ,nonatomic)BOOL isShowSpaceLine;
/**
 默认分割线颜色*/
@property (strong ,nonatomic)UIColor *defaultSpaceColor;
/**
 是否显示滚动条*/
@property (assign ,nonatomic)BOOL isShowSlideLine;
/**
 默认滚动条颜色*/
@property (strong ,nonatomic)UIColor *defaultSlideColor;

/**
 滚动条的宽度 是否根据字符串长度变化（Yes 等宽 ，No 根据字符串长度变化 默认为 Yes）*/
@property (assign ,nonatomic)BOOL isEqualWidth;



@end
NS_ASSUME_NONNULL_END
