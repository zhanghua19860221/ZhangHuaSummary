//
//  ZHPictureCache.h
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/9/1.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHWebImageCache.h"
@interface ZHPictureCache : UIViewController<UITableViewDelegate,UITableViewDataSource,ZHWebImageDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *imageArray;
@property (strong, nonatomic) ZHWebImageCache *objectCache;
@end
