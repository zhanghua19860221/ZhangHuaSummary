//
//  ZHBezierPathController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/21.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHBezierPathController.h"
#import "ZHMaskView.h"
@interface ZHBezierPathController ()

@end

@implementation ZHBezierPathController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createSubView];
    // Do any additional setup after loading the view.
}
-(void)createSubView{
    
    ZHMaskView *view = [[ZHMaskView alloc] init];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        
    }];
    
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
