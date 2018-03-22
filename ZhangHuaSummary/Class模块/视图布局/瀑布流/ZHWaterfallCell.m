//
//  ZHWaterfallCell.m
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/8/24.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import "ZHWaterfallCell.h"

@implementation ZHWaterfallCell
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        
        _label = [[UILabel alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _label.backgroundColor = [UIColor whiteColor];
        _label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_label];
    }
    return self;
}
-(void)addDataSourceToCell:(NSString*)LabelStr{
    _label.text = LabelStr;
    
    _label.textColor = [UIColor redColor];
}
@end
