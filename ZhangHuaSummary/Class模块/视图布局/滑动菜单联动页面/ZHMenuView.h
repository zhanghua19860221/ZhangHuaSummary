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

-(id)initTitleArray:(NSArray*)titles;

-(void)updataSelectMenuIndex:(NSInteger)index;

@property (nonatomic) id<ZHMenuDelegateIndex>delegate;


@end
