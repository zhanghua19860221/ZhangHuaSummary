//
//  ZHQRCodePay.m
//  ZhangHuaSummary
//
//  Created by 张华 on 17/12/7.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import "ZHQRCodePay.h"
#import "ZHScanViewController.h"
@interface ZHQRCodePay ()

@end

@implementation ZHQRCodePay

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * payButton = [UIButton buttonWithType:UIButtonTypeCustom];
    payButton.frame = CGRectMake(130, 200, 80, 40);
    [payButton setTitle:@"点击扫描" forState:UIControlStateNormal];
    [payButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [payButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:payButton];
    // Do any additional setup after loading the view.
}
- (void)click:(UIButton*)btn{
    
    ZHScanViewController * scan = [[ZHScanViewController alloc]init];
    [self.navigationController pushViewController:scan animated:YES];
    
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
