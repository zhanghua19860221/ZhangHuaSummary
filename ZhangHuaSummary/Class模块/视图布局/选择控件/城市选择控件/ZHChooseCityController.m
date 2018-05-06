//
//  ZHChooseCityController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/16.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHChooseCityController.h"
#import "ZHChooseCityView.h"
@interface ZHChooseCityController ()

@end

@implementation ZHChooseCityController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createSubview];
    // Do any additional setup after loading the view.
}
- (void)createSubview{
    
    ZHChooseCityView * view = [[ZHChooseCityView alloc] initWithFrame:CGRectMake(0, 0, SC_WIDTH, SC_HEIGHT)];
    view.selectedBlock = ^(NSString * province, NSString * city, NSString * area){
   
        NSLog(@"%@%@%@",province,city,area);
        
    };
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
