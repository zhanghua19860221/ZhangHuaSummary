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
    UIButton *cancleBtn;//按钮

}

@end

@implementation ZHShareChooseView
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    }
    [self initSubviews];
    [self startAnimation];

    return self;
}

-(void)initSubviews{
    z_chooseView = [[UIView alloc] initWithFrame:CGRectMake(W(10), HEIGHT, WIDTH-W(20), H(120))];
    z_chooseView.layer.masksToBounds = YES;
    z_chooseView.layer.cornerRadius = W(10);
    [self addSubview:z_chooseView];
    z_chooseView.backgroundColor = COLORFromRGB(0xffffff);
    
    cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancleBtn.titleLabel.font = [UIFont systemFontOfSize:W(18)];
    [cancleBtn setTitleColor:COLORFromRGB(0x6c6c6c) forState:UIControlStateNormal];
    [cancleBtn addTarget:self action:@selector(cancle:) forControlEvents:UIControlEventTouchUpInside];
    cancleBtn.backgroundColor = COLORFromRGB(0xffffff);
    cancleBtn.layer.masksToBounds = YES;
    cancleBtn.layer.cornerRadius = W(10);
    cancleBtn.frame = CGRectMake(W(10), HEIGHT + H(120) + H(20), WIDTH-W(20), H(40));
    [self addSubview:cancleBtn];

}
-(void) startAnimation {
    [UIView animateWithDuration:0.25 animations:^{
       z_chooseView.frame = CGRectMake(W(10), HEIGHT-H(200), WIDTH-W(20), H(120));
       cancleBtn.frame = CGRectMake(W(10), HEIGHT - H(60), WIDTH-W(20), H(40));
        
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
            make.centerY.equalTo(z_chooseView.mas_centerY).offset(-H(10));
            if (tempBtn) {
                make.left.equalTo(tempBtn.mas_right);
            }else{
                make.left.equalTo(z_chooseView).offset(W(30));
            }
            make.height.mas_equalTo(Hbtn);
            make.width.mas_equalTo((WIDTH-W(80))/dataArray.count);
            
        }];
        tempBtn = button;
        
        //label控件
        UILabel *label = [[UILabel alloc] init];
        label.text = dataArray[i][@"text"];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:W(12)];
        [label setTextColor:COLORFromRGB(0x333333)];
        [z_chooseView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(z_chooseView.mas_centerY).offset(H(30));
            make.centerX.equalTo(button.mas_centerX);
            make.height.mas_equalTo(W(13));
            make.width.mas_equalTo((WIDTH-W(60))/dataArray.count);
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
        case 103:
            
            break;
        default:
            break;
    }
}
- (void)cancle:(UIButton *)btn{
    [UIView animateWithDuration:0.25 animations:^{
        z_chooseView.frame = CGRectMake(W(15), HEIGHT, WIDTH-W(30), H(120));
        cancleBtn.frame = CGRectMake(W(15), HEIGHT + H(120) + H(20), WIDTH-W(30), H(40));
        self.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        self.hidden = YES;
        
    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [UIView animateWithDuration:0.25 animations:^{
        z_chooseView.frame = CGRectMake(W(10), HEIGHT, WIDTH-W(20), H(120));
        cancleBtn.frame = CGRectMake(W(10), HEIGHT + H(120) + H(20), WIDTH-W(20), H(40));
        self.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        self.hidden = YES;
        
    }];
    
}


@end
