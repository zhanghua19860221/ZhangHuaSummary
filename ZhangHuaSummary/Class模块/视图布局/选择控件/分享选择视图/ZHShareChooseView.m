//
//  ZHShareChooseView.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/26.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHShareChooseView.h"
//获取屏幕宽高
#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height
#define kButtonTag 100

@interface ZHShareChooseView()
{
    UIView *z_chooseView;//背景视图
}

@end

@implementation ZHShareChooseView
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    }
    [self initSubviews];
    [self startAnimation];

    return self;
}

-(void)initSubviews{
    z_chooseView = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT, WIDTH, H(150))];
    [self addSubview:z_chooseView];
    z_chooseView.backgroundColor = COLORFromRGB(0xffffff);

}
-(void) startAnimation {
    [UIView animateWithDuration:0.5 animations:^{
        z_chooseView.frame = CGRectMake(0, HEIGHT-H(150), WIDTH, H(150));
        
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)setDataArray:(NSArray *)dataArray{
    UIButton *tempBtn = nil;
    
    CGFloat Hbtn = z_chooseView.frame.size.height;
    
    for (int i = 0; i<dataArray.count ; i++) {
        //icon控件
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:dataArray[i][@"img"]] forState:UIControlStateNormal];
        button.tag = kButtonTag+i;
        [z_chooseView addSubview:button];
        button.imageView.contentMode = UIViewContentModeScaleAspectFit;
        button.backgroundColor = [UIColor clearColor];
        [button addTarget:self action:@selector(requestViewClick:) forControlEvents:UIControlEventTouchUpInside];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(z_chooseView.mas_centerY).offset(-W(20));
            if (tempBtn) {
                make.left.equalTo(tempBtn.mas_right);
            }else{
                make.left.equalTo(z_chooseView);
            }
            make.height.mas_equalTo(Hbtn);
            make.width.mas_equalTo(WIDTH/dataArray.count);
            
        }];
        tempBtn = button;
        
        //label控件
        UILabel *label = [[UILabel alloc] init];
        label.text = dataArray[i][@"text"];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:W(18)];
        [label setTextColor:COLORFromRGB(0x333333)];
        [z_chooseView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(z_chooseView.mas_centerY).offset(W(25));
            make.centerX.equalTo(button.mas_centerX);
            make.height.mas_equalTo(W(18));
            make.width.mas_equalTo(WIDTH/dataArray.count);
        }];
        
    }
    
    
}
- (void)requestViewClick:(UIButton *)btn{
    switch (btn.tag) {
        case 100:
            
            break;
        case 101:
            
            break;
        case 102:
            
            break;
        default:
            break;
    }
  
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [UIView animateWithDuration:0.5 animations:^{
        z_chooseView.frame = CGRectMake(0, HEIGHT, WIDTH, H(150));
        self.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        self.hidden = YES;
        
    }];
    
}


@end
