//
//  ZHBasicsTableViewController.h
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/8/23.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHBasicsTableViewController : UITableViewController

/**
 <#Description#> List - 目录列表
 
 */
@property (strong , nonatomic) NSArray *tableListArray;

/**
 <#Description#> Name - 控制器名称
 */
@property (strong , nonatomic) NSArray *controllerTitle;

@end
