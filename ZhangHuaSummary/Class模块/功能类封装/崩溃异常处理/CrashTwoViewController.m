//
//  CrashTwoViewController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/8/13.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "CrashTwoViewController.h"

@interface CrashTwoViewController ()

@end

@implementation CrashTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.backgroundColor = [UIColor grayColor].CGColor;

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//        NSArray *array = @[@"123",@"1231"];
//        NSLog(@"array == %@",array[3]);
    
    NSString *str = NULL;
    NSDictionary *dic = @{@"str":str};
    NSLog(@"%@",dic[@"str"]);
    
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
