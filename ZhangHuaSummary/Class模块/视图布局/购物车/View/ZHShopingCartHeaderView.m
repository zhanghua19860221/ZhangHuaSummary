//
//  ZHShopingCartHeaderView.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/10/8.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHShopingCartHeaderView.h"
@interface ZHShopingCartHeaderView(){
    UIImageView *storeImageView;
    UILabel *storeNameLabel;

    
}
@end

@implementation ZHShopingCartHeaderView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        self.clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_clickBtn];
        
        storeImageView = [[UIImageView alloc] init];
        [self addSubview:storeImageView];
        
        storeNameLabel = [[UILabel alloc] init];
        [self addSubview:storeNameLabel];

    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [_clickBtn addTarget:self action:@selector(chooseClick:) forControlEvents:UIControlEventTouchUpInside];
    [_clickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self).offset(W(15));
        make.width.height.mas_equalTo(W(30));
        
    }];
    
    storeImageView.image = [UIImage imageNamed:@"店铺.png"];
    storeImageView.contentMode =  UIViewContentModeScaleAspectFit;
    [storeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(_clickBtn.mas_right).offset(W(15));
        make.width.height.mas_equalTo(W(30));
        
    }];
    
    storeNameLabel.font = [UIFont systemFontOfSize:W(15)];
    storeNameLabel.textColor = COLORFromRGB(0x333333);
    [storeNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(storeImageView.mas_right).offset(W(10));
        make.right.equalTo(self);
        make.height.mas_equalTo(H(15));
        
    }];
    
}
- (void)chooseClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        [sender setImage:[UIImage imageNamed:@"box_unchoose.png"] forState:UIControlStateSelected];
    } else {
        [sender setImage:[UIImage imageNamed:@"box_choose.png"] forState:UIControlStateNormal];
    }
    if (_clickBtn) {
        self.ClickBlock(sender.selected);
    }
}
-(void)setStoreModel:(ZH_StoreModel *)storeModel{
    _storeModel = storeModel;
    NSLog(@"storeModel ==== %@",storeModel.shopName);
    storeNameLabel.text = storeModel.shopName;
    self.isClick = storeModel.isSelect;
    
}

- (void)setIsClick:(BOOL)isClick {
    _isClick = isClick;
    _clickBtn.selected = isClick;
    if (_isClick) {
        [_clickBtn setImage:[UIImage imageNamed:@"box_unchoose.png"] forState:UIControlStateSelected];
    } else {
        [_clickBtn setImage:[UIImage imageNamed:@"box_choose.png"] forState:UIControlStateNormal];
    }
}

@end
