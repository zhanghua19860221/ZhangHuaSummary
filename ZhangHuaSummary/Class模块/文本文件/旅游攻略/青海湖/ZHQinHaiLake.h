//
//  ZHQinHaiLake.h
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/9/5.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHQinHaiLake : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
//每个Cell内容数据
@property (strong, nonatomic) NSMutableArray *tableArray;
//每个Cell路线详情数据
@property (strong, nonatomic) NSMutableArray *detailArray;
//tableView头视图headView
@property (strong, nonatomic) UIImageView *headView;
//headView的状态
@property (assign, nonatomic) BOOL isClick;

@end
