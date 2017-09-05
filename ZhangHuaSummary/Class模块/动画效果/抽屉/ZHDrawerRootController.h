//
//  ZHDrawerRootController.h
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/8/29.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftViewController.h"
#import "MidViewController.h"
#import "RightViewController.h"
@interface ZHDrawerRootController : UIViewController

@property (strong, nonatomic) LeftViewController *left;
@property (strong, nonatomic) MidViewController *mid;
@property (strong, nonatomic) RightViewController *right;

@end
