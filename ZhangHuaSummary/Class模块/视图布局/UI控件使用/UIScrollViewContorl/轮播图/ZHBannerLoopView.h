//
//  ZHBannerLoopView.h
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/8/28.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol bannerDelegate <NSObject>
- (void)click:(NSInteger)index;

@end

@interface ZHBannerLoopView : UIView
@property(assign, nonatomic) float            timerInterval; //设置定时器的间隔时间
@property(strong, nonatomic) NSArray       *  bannerArray;   //轮播图name数组
@property (nonatomic, assign) id<bannerDelegate> delegate;

- (id)initWithFrame:(CGRect)frame;

@end
