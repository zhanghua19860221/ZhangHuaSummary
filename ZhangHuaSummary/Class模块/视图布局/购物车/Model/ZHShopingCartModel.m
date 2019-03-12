//
//  ZHShopingCartModel.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/10/8.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHShopingCartModel.h"

@implementation ZH_StoreModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.goodsArray = [NSMutableArray new];
    }
    return self;
}

- (void)setGoods:(NSMutableArray<ZH_GoodsModel *> *)goods {
    _goods = goods;
    NSMutableArray *tempArray = [NSMutableArray new];
    for (NSDictionary *dic in goods) {
        ZH_GoodsModel *model = [[ZH_GoodsModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [tempArray addObject:model];
    }
    self.goodsArray = [NSMutableArray arrayWithArray: tempArray];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end

@implementation ZH_GoodsModel

@end
