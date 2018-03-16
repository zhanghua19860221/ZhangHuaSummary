//
//  ZHLoadingView.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/14.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHLoadingView.h"


@implementation ZHLoadingView


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
        
    }
    return self;
}
- (void)initSubViews{
        
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        self.layer.masksToBounds = YES ;
        self.layer.cornerRadius = 5 ;
    
        _progressView = [[UIActivityIndicatorView alloc]
                         initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _progressView.color = COLORFromRGB(0xffffff);
        [self addSubview:_progressView];
        [_progressView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY);
            
        }];
        [_progressView startAnimating];
    
//        //缩放菊花的大小
//        CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, 1.0f);
//        _progressView.transform = transform;

        //创建菊花下面文字
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"loading...";
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_progressView.mas_bottom).offset(10);
            make.left.equalTo(self.mas_left);
            make.width.equalTo(self.mas_width);
            make.height.mas_equalTo(14);

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
