//
//  ZHWaterfallCell.h
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/8/24.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHWaterfallCell : UICollectionViewCell
@property (strong ,nonatomic) UILabel *label;
-(void)addDataSourceToCell:(NSString*)LabelStr;
@end
