//
//  ZHShopingCartHeaderView.h
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/10/8.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHShopingCartModel.h"

@interface ZHShopingCartHeaderView : UITableViewHeaderFooterView
@property (nonatomic, strong) ZH_StoreModel *storeModel;
@property (strong ,nonatomic) UIButton *clickBtn;
@property (nonatomic, copy) void (^ClickBlock)(BOOL isClick);
@property (nonatomic, assign) BOOL isClick;
@end
