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
        _label.font = [UIFont systemFontOfSize:self.frame.size.height/3];
        [self.contentView addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView.mas_centerX);
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.height.mas_equalTo(self.frame.size.height/3);
            make.width.mas_equalTo(self.frame.size.width);


            
        }];
    }
    return self;
}
-(void)addDataSourceToCell:(NSString*)LabelStr{
    _label.text = LabelStr;
    [_label setTextColor:COLORFromRGB(0xe10000)];
}
@end
