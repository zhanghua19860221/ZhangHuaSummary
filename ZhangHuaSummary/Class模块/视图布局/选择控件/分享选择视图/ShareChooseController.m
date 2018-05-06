//
//  ShareChooseController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/26.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ShareChooseController.h"
#import "ZHShareChooseView.h"
@interface ShareChooseController ()

@end

@implementation ShareChooseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createSubview];
    // Do any additional setup after loading the view.
}
- (void)createSubview{
    
    ZHShareChooseView * chooseView = [[ZHShareChooseView alloc] initWithFrame:CGRectMake(0, 0, SC_WIDTH, SC_HEIGHT)];
    NSArray *listArr = @[@{@"img":@"QQ", @"text":@"QQ"}, @{@"img":@"微信", @"text":@"微信"}, @{@"img":@"通讯录", @"text":@"通讯录"}];
    chooseView.dataArray = listArr;
    [self.view addSubview:chooseView];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
