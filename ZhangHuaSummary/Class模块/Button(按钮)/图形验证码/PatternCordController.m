//
//  PatternCordController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/4/13.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "PatternCordController.h"
#import "ZHPatternCordView.h"

@interface PatternCordController ()
@property (nonatomic, strong) ZHPatternCordView *codeImageView;

@end

@implementation PatternCordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initSubView];
    // Do any additional setup after loading the view.
}
- (void)initSubView{
    
    _codeImageView = [[ZHPatternCordView alloc] initWithFrame:CGRectMake(100, 100, 80, 35)];
    _codeImageView.bolck = ^(NSString *imageCodeStr){//看情况是否需要
        NSLog(@"imageCodeStr = %@",imageCodeStr);
    };
    _codeImageView.isRotation = NO;
    [_codeImageView freshVerCode];
    
    //点击刷新
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    [_codeImageView addGestureRecognizer:tap];
    [self.view addSubview: _codeImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tapClick:(UITapGestureRecognizer*)tap
{
    [_codeImageView freshVerCode];
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
