//
//  ZHWaterfallStyle.h
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/8/24.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHCustomLayOut.h"
#import "ZHWaterfallCell.h"
@interface ZHWaterfallStyle : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) ZHCustomLayOut *layout;

@end
