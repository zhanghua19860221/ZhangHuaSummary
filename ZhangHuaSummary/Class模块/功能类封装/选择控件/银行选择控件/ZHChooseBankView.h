//
//  ZHChooseBankView.h
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/16.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^chooseBankBlock)(NSString *);

@interface ZHChooseBankView : UIView

@property (copy , nonatomic)chooseBankBlock  chooseBankBlock;

-(void)getChooseBank:(chooseBankBlock)chooseBank;

@end
