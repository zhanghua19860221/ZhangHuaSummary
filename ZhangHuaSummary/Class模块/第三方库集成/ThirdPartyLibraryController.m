//
//  ThirdPartyLibraryController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2019/2/13.
//  Copyright © 2019年 zhanghua0221. All rights reserved.
//

#import "ThirdPartyLibraryController.h"

@interface ThirdPartyLibraryController ()

@end

@implementation ThirdPartyLibraryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableListArray = @[@"友盟分享",@"友盟调起微信小程序"];
    self.controllerTitle = @[@"YouMengShareController",@"SmallProgramController"];
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

@end
