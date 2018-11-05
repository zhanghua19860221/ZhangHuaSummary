//
//  ZHShopingCartCell.h
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/10/8.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHShopingCartModel.h"

@interface ZHShopingCartCell : UITableViewCell

@property (strong ,nonatomic)UIButton *clickBtn;

/* 选中 */
@property (copy ,nonatomic) void (^ClickRowBlock)(BOOL isClick);

/* 加 */
@property (copy ,nonatomic) void (^AddBlock)(UILabel *countLabel);

/* 减 */
@property (copy ,nonatomic) void (^CutBlock)(UILabel *countLabel);


@property (strong ,nonatomic) ZH_GoodsModel *goodsModel;

@end
