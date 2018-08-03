//
//  ZHDatePickView.h
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/8/3.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^chooseDateBlock)(NSString *);

@interface ZHDatePickView : UIView
@property (copy , nonatomic)chooseDateBlock  chooseDateBlock;

-(void)getChooseBank:(chooseDateBlock)chooseDate;
@end
