//
//  ZHLoadingView.h
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/14.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHLoadingView : UIView
@property (strong , nonatomic)UIActivityIndicatorView *progressView;//进度条
@property (strong , nonatomic)UILabel *titleLabel;//菊花条下方字体

- (id)initWithFrame:(CGRect)frame;

@end
