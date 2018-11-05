//
//  ZHShopingCartCell.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/10/8.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHShopingCartCell.h"
@interface ZHShopingCartCell(){
    UIImageView *goodImageView;
    
    UILabel *goodsNameLabel;
    UILabel *brandLabel;
    UILabel *priceLabel;
    
    UIImageView *bgView;
    
    UILabel  *countLabel;
    UIButton *cutBtn;
    UIButton *addBtn;
    
}
@end

@implementation ZHShopingCartCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_clickBtn];
        
        goodImageView = [[UIImageView alloc] init];
        [self addSubview:goodImageView];
        
        goodsNameLabel = [[UILabel alloc] init];
        [self addSubview:goodsNameLabel];
        brandLabel = [[UILabel alloc] init];
        [self addSubview:brandLabel];
        priceLabel = [[UILabel alloc] init];
        [self addSubview:priceLabel];
        
        bgView = [[UIImageView alloc] init];
        [self addSubview:bgView];

        
        countLabel = [[UILabel alloc] init];
        [bgView addSubview:countLabel];
        cutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [bgView addSubview:cutBtn];
        addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [bgView addSubview:addBtn];
        
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
    
    
    goodImageView.backgroundColor = randomColor;
    [goodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(_clickBtn.mas_right).offset(W(15));
        make.width.height.mas_equalTo(W(80));
        
    }];
    
    goodsNameLabel.font = [UIFont systemFontOfSize:W(12)];
    goodsNameLabel.textColor = COLORFromRGB(0x333333);
    [goodsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(goodImageView);
        make.left.equalTo(goodImageView.mas_right).offset(W(5));
        make.right.equalTo(self);
        make.height.mas_equalTo(H(12));
 
    }];
    
    brandLabel.font = [UIFont systemFontOfSize:W(12)];
    brandLabel.textColor = COLORFromRGB(0x333333);
    [brandLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(goodsNameLabel.mas_bottom).offset(10);
        make.left.equalTo(goodImageView.mas_right).offset(W(5));
        make.right.equalTo(self);
        make.height.mas_equalTo(H(12));
        
    }];
    
    priceLabel.font = [UIFont systemFontOfSize:W(12)];
    priceLabel.textColor = COLORFromRGB(0x333333);
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(goodImageView.mas_bottom);
        make.left.equalTo(goodImageView.mas_right).offset(W(5));
        make.right.equalTo(self);
        make.height.mas_equalTo(H(12));
        
    }];

    bgView.layer.borderColor = COLORFromRGB(0x333333).CGColor;
    bgView.layer.borderWidth = 1;
    bgView.layer.masksToBounds = YES;
    bgView.layer.cornerRadius = W(5);
    bgView.userInteractionEnabled = YES;
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(goodImageView.mas_bottom);
        make.right.equalTo(self).offset(-W(15));
        make.height.mas_equalTo(W(30));
        make.width.mas_equalTo(W(90));

        
    }];

    [addBtn setTitle:@"+" forState:UIControlStateNormal];
    [addBtn setTitleColor:COLORFromRGB(0x333333) forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgView);
        make.right.equalTo(bgView);
        make.width.height.mas_equalTo(W(30));

    }];
    
    countLabel.font = [UIFont systemFontOfSize:W(12)];
    countLabel.textColor = COLORFromRGB(0x333333);
    countLabel.textAlignment = NSTextAlignmentCenter;
    countLabel.layer.borderColor = COLORFromRGB(0x333333).CGColor;
    countLabel.layer.borderWidth = 1;
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgView);
        make.right.equalTo(addBtn.mas_left);
        make.width.height.mas_equalTo(W(30));

    }];
    
    [cutBtn setTitle:@"-" forState:UIControlStateNormal];
    [cutBtn setTitleColor:COLORFromRGB(0x333333) forState:UIControlStateNormal];
    [cutBtn addTarget:self action:@selector(cut:) forControlEvents:UIControlEventTouchUpInside];
    [cutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgView);
        make.left.equalTo(bgView);
        make.width.height.mas_equalTo(W(30));
        
    }];
    
}
-(void)setGoodsModel:(ZH_GoodsModel *)goodsModel{
    NSLog(@"goodsModel == %@",goodsModel);
    _goodsModel = goodsModel;
    _clickBtn.selected = goodsModel.isSelect;
    if (goodsModel.isSelect) {
        [_clickBtn setImage:[UIImage imageNamed:@"box_unchoose.png"] forState:(UIControlStateNormal)];
    } else {
        [_clickBtn setImage:[UIImage imageNamed:@"box_choose.png"] forState:(UIControlStateNormal)];
    }
    
    goodsNameLabel.text = goodsModel.goodsName;
    brandLabel.text = goodsModel.shopName;
    priceLabel.text = [NSString stringWithFormat:@"%@元",goodsModel.realPrice];
    countLabel.text = [NSString stringWithFormat:@"%@",goodsModel.count];
}
- (void)add:(UIButton *)btn{
    NSInteger count = [countLabel.text integerValue];
    count++;
    countLabel.text = [NSString stringWithFormat:@"%ld", count];
    if (self.AddBlock) {
        self.AddBlock(countLabel);
    }
    
}
- (void)cut:(UIButton *)btn{
    NSInteger count = [countLabel.text integerValue];
    count--;
    if (count <= 0) {
        return;
    }
    countLabel.text = [NSString stringWithFormat:@"%ld", count];
    if (self.CutBlock) {
        self.CutBlock(countLabel);
    }
    
}
- (void)chooseClick:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [btn setImage:[UIImage imageNamed:@"box_unchoose.png"] forState:UIControlStateSelected];
    } else {
        [btn setImage:[UIImage imageNamed:@"box_choose.png"] forState:UIControlStateNormal];
    }
    if (self.ClickRowBlock) {
        self.ClickRowBlock(btn.selected);
    }
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
