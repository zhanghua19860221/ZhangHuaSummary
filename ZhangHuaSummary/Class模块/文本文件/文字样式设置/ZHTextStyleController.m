//
//  ZHTextStyleController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/4/17.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHTextStyleController.h"

@interface ZHTextStyleController ()

@end

@implementation ZHTextStyleController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 建一个小文本用来测试
    UILabel * label = [[UILabel alloc] initWithFrame:[UIScreen mainScreen].bounds];
    label.font = [UIFont systemFontOfSize:30];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    NSString *str = @"测试文字:\n改变文字间距\n改变文字大小\n改变文字颜色\n改变文字背景\n添加文字删除线\n添加文字下划线\n设置字体倾斜\n设置文本扁平化";
    
    NSMutableAttributedString * attributedText = [[NSMutableAttributedString alloc] initWithString:str];
    // 改变文字间距
    [attributedText setAttributes:@{NSKernAttributeName:@10} range:NSMakeRange(6, 6)];
    // 改变文字大小
    [attributedText setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:30]} range:NSMakeRange(13, 6)];
    // 改变文字颜色
    [attributedText setAttributes:@{NSForegroundColorAttributeName :[UIColor redColor]} range:NSMakeRange(20, 6)];
    // 改变文字颜色
    [attributedText setAttributes:@{NSBackgroundColorAttributeName: [UIColor yellowColor] } range:NSMakeRange(27, 6)];
    // 添加文字删除线 (NSUnderlineStyleSingle是个枚举,详细的自己试)
    [attributedText setAttributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle) } range:NSMakeRange(34, 7)];
    // 添加文字下划线 (NSUnderlineStyleSingle是个枚举,详细的自己试)
    [attributedText setAttributes:@{NSUnderlineStyleAttributeName:@(NSUnderlineStyleThick) } range:NSMakeRange(42, 7)];
    // 设置字体倾斜
    [attributedText setAttributes:@{NSObliquenessAttributeName:@0.5} range:NSMakeRange(50, 6)];
    // 设置文本扁平化
    [attributedText setAttributes:@{NSExpansionAttributeName:@0.4} range:NSMakeRange(57, 7)];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:W(8)];
    //设置文字的距中
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    //设置文字的头缩进
    //[paragraphStyle setFirstLineHeadIndent:W(26)];
    [attributedText addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, str.length)];
    // 更改后的文字赋值
    label.attributedText = attributedText;
    [self.view addSubview:label];
    // Do any additional setup after loading the view.
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
