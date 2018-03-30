//
//  BasicsFundationController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/30.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "BasicsFundationController.h"

@interface BasicsFundationController ()

@end

@implementation BasicsFundationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initTableViewData];

}
-(void)initTableViewData{
    
    NSArray *tempListArray = @[@"KVO",];
    self.tableListArray = [tempListArray copy];
    NSArray *tempTitle  = @[@"ZHKVOController"];
    self.controllerTitle = [tempTitle copy];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
