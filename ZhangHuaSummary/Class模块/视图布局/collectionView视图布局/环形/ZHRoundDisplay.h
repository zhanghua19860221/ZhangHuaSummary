//
//  ZHRoundDisplay.h
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/8/29.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHRoundLayout.h"
@interface ZHRoundDisplay : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) ZHRoundLayout *layout;

@end
