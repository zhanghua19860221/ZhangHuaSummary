//
//  CollectionViewController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/5/6.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableListArray = @[@"瀑布流",@"环形"];
    self.controllerTitle = @[@"ZHWaterfallStyle",@"ZHRoundDisplay"];
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
