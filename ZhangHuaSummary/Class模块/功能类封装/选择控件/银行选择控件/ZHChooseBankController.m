//
//  ZHChooseBankController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/16.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHChooseBankController.h"
#import "ZHChooseBankView.h"
@interface ZHChooseBankController ()

@end

@implementation ZHChooseBankController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createSubview];

    // Do any additional setup after loading the view.
}
- (void)createSubview{
    ZHChooseBankView * view = [[ZHChooseBankView alloc] initWithFrame:CGRectMake(0, SC_HEIGHT-240, SC_WIDTH, 240)];

    [self.view addSubview:view];
    
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
