//
//  ZHShopppingCartBottomView.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/10/8.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHShopppingCartBottomView.h"
@interface ZHShopppingCartBottomView(){
    UILabel  *label;
    UIButton *btn;
    
}
@end
@implementation ZHShopppingCartBottomView
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        
        self.clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_clickBtn];
        
        label = [[UILabel alloc] init];
        [self addSubview:label];
        
        self.allPriceLabel = [[UILabel alloc] init];
        [self addSubview:_allPriceLabel];
        
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        

    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    _clickBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [_clickBtn addTarget:self action:@selector(allClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_clickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self).offset(W(15));
        make.width.mas_equalTo(W(23));
        make.height.mas_equalTo(49);

    }];

    label.font = [UIFont systemFontOfSize:W(13)];
    label.textColor = COLORFromRGB(0x666666);
    label.text = @"全选";
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_clickBtn.mas_centerY);
        make.left.equalTo(_clickBtn.mas_right).offset(W(10));
        make.width.mas_equalTo(W(30));
        make.height.mas_equalTo(H(15));

    }];
    btn.backgroundColor = COLORFromRGB(0xe10000);
    [btn setTitle:@"去结算" forState:UIControlStateNormal];
    [btn setTitleColor:COLORFromRGB(0xffffff) forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(accountBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.right.equalTo(self);
        make.width.mas_equalTo(W(80));
        make.height.mas_equalTo(49);
        
    }];
    
    _allPriceLabel.font = [UIFont systemFontOfSize:W(15)];
    _allPriceLabel.textColor = COLORFromRGB(0x333333);
    _allPriceLabel.text = @"合计:￥0.00";
    [_allPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_clickBtn.mas_centerY);
        make.left.equalTo(label.mas_right).offset(W(10));
        make.right.equalTo(btn.mas_left);
        make.height.mas_equalTo(H(15));
        
    }];

}
- (void)allClickBtn:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        [sender setImage:[UIImage imageNamed:@"box_unchoose.png"] forState:(UIControlStateNormal)];
    } else {
        [sender setImage:[UIImage imageNamed:@"box_choose.png"] forState:(UIControlStateNormal)];
    }
    if (self.AllClickBlock) {
        self.AllClickBlock(sender.selected);
    }
}

- (void)accountBtn:(UIButton *)sender {
    if (self.AccountBlock) {
        self.AccountBlock();
    }
}

- (void)setIsClick:(BOOL)isClick {
    _isClick = isClick;
    self.clickBtn.selected = isClick;
    if (isClick) {
        [self.clickBtn setImage:[UIImage imageNamed:@"box_unchoose.png"] forState:(UIControlStateNormal)];
    } else {
        [self.clickBtn setImage:[UIImage imageNamed:@"box_choose.png"] forState:(UIControlStateNormal)];
    }
}

@end
