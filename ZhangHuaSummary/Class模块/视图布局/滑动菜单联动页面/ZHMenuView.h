//
//  ZHMenuView.h
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/13.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ZHMenuDelegateIndex<NSObject>

@required//必须要实现的协议方法 @optional(此方法修饰协议方法可以不实现)
- (void)changeSelectMenuIndex:(NSInteger)index;


@end

@interface ZHMenuView : UIView

- (id)initWithFrame:(CGRect)rect titleArray:(NSArray*)titles;
- (void)updataSelectMenuIndex:(NSInteger)index;

@property (weak, nonatomic) id<ZHMenuDelegateIndex>delegate;
@property (assign ,nonatomic)BOOL isShowSpaceLine;//是否显示分割线
@property (assign ,nonatomic)BOOL isShowSlideLine;//是否显示滚动条
@property (assign ,nonatomic)CGFloat selectFont; //选中按钮字体大小
@property (strong ,nonatomic)UIColor *selectColor;//选中按钮字体颜色



@end
