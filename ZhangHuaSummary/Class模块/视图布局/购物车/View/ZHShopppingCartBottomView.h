//
//  ZHShopppingCartBottomView.h
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/10/8.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHShopppingCartBottomView : UIView
@property (strong, nonatomic) UILabel *allPriceLabel;
@property (strong, nonatomic) UIButton *clickBtn;
@property (assign, nonatomic) BOOL isClick;

@property (copy, nonatomic) void (^AllClickBlock)(BOOL isClick);
@property (copy, nonatomic) void (^AccountBlock)();

@end
