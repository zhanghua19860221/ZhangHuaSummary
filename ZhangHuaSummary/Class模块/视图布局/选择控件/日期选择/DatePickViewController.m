//
//  DatePickViewController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/8/3.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "DatePickViewController.h"
#import "ZHDatePickView.h"

@interface DatePickViewController ()

@end

@implementation DatePickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createSubviews];
    // Do any additional setup after loading the view.
}
- (void)createSubviews{
    ZHDatePickView * chooseView = [[ZHDatePickView alloc] initWithFrame:CGRectMake(0, 0, SC_WIDTH, SC_HEIGHT)];
    
    //确定按钮的点击回调事件
    //    __weak typeof(self) weakSelf = self;
    [chooseView getChooseBank:^(NSString *date) {
        
        NSLog(@"%@",date);
        
    }];
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
