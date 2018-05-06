//
//  ZHChooseCityView.h
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/16.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectedHandle)(NSString * province, NSString * city, NSString * area);

@interface ZHChooseCityView : UIView

@property(nonatomic, copy) SelectedHandle selectedBlock;

@end
