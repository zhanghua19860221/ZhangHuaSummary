//
//  QinHaiLakeTransportLine.m
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/9/5.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import "QinHaiLakeTransportLine.h"

@interface QinHaiLakeTransportLine ()

@end

@implementation QinHaiLakeTransportLine

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTextField];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
-(void)createTextField{
    
    self.textView = [[UITextView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.textView setText:self.lineStr];
    UIColor *color = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    //textView文本样式设置
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 10;// 字体的行间距
    paragraphStyle.firstLineHeadIndent = 33.f; //首行缩进宽度
    paragraphStyle.alignment = NSTextAlignmentJustified;
    
    NSDictionary *attributes = @{
                                 
                                 NSFontAttributeName:[UIFont systemFontOfSize:17],
                                 
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 
                                 };
    self.textView.attributedText = [[NSAttributedString alloc] initWithString:self.textView.text attributes:attributes];
    [self.textView setTextColor:color];
    [self.view addSubview:self.textView];
    
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
