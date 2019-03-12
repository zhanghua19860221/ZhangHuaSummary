//
//  ZHShopingCartModel.h
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/10/8.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZH_StoreModel : NSObject
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSArray *goods;
@property (nonatomic, strong) NSString *shopName;
@property (nonatomic, strong) NSString *sid;

@property (nonatomic, strong) NSMutableArray *goodsArray;
@property (nonatomic, assign) BOOL isSelect;

@end

@interface ZH_GoodsModel : NSObject
@property (nonatomic, strong) NSString *categoryId;
@property (nonatomic, strong) NSString *count;
@property (nonatomic, strong) NSString *goodsId;
@property (nonatomic, strong) NSString *goodsName;
@property (nonatomic, strong) NSString *goodsType;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *orginalPrice;
@property (nonatomic, strong) NSString *realPrice;
@property (nonatomic, strong) NSString *shopId;
@property (nonatomic, strong) NSString *shopName;
@property (nonatomic, strong) NSString *total;
@property (nonatomic, strong) NSString *sid;
@property (nonatomic, strong) NSString *userId;

@property (nonatomic, assign) BOOL isSelect;

@end
