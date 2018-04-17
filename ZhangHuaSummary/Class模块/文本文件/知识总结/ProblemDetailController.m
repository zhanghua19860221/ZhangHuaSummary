//
//  ProblemDetailController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/4/16.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ProblemDetailController.h"

@interface ProblemDetailController ()
@property(strong , nonatomic)UIScrollView *scrollView;


@end

@implementation ProblemDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLORFromRGB(0xf9f9f9);
    [self createView];
    
    // Do any additional setup after loading the view.
}
- (UIScrollView*)scrollView{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SC_WIDTH, SC_HEIGHT)];
        _scrollView.backgroundColor = COLORFromRGB(0xf9f9f9);
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}
- (void)createView {
    
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = COLORFromRGB(0xffffff);
    [self.scrollView addSubview:bgView];

    UILabel *problem = [[UILabel alloc] init];
    [self.scrollView addSubview:problem];
    NSString *temp = _dataDic[@"problem"];    
    // 创建Attributed
    NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:temp];
    // 需要改变的第一个文字的位置
    NSUInteger index = [[noteStr string] rangeOfString:@"、"].location;
    NSString *tempOne = [temp substringFromIndex:index+1];
    
    problem.text = tempOne;
    problem.font = [UIFont systemFontOfSize:W(16)];
    problem.textColor = COLORFromRGB(0x333333);
    problem.backgroundColor = COLORFromRGB(0xffffff);
    
    [problem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView).offset(H(20));
        make.left.equalTo(self.view).offset(W(15));
        make.width.mas_equalTo(SC_WIDTH-W(30));
        make.height.mas_equalTo(H(16));

    }];
    
    UIImageView *line = [[UIImageView alloc] init];
    [self.scrollView addSubview:line];
    line.backgroundColor = COLORFromRGB(0x999999);
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(problem.mas_bottom).offset(H(20));
        make.left.equalTo(self.view).offset(W(15));
        make.right.equalTo(self.view).offset(-W(15));
        make.height.mas_equalTo(H(1));
        
    }];
    
    UILabel *answerLab = [[UILabel alloc] initWithFrame:CGRectMake(W(15), H(77), SC_WIDTH - W(30), SC_HEIGHT)];
    answerLab.textColor = COLORFromRGB(0x333333);
    answerLab.numberOfLines = 0;
    answerLab.font = [UIFont systemFontOfSize:W(13)];
    [self.scrollView addSubview:answerLab];
    NSString *content = _dataDic[@"answer"];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:content];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:W(8)];
    [paragraphStyle setFirstLineHeadIndent:W(26)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, content.length)];
    answerLab.attributedText = attributedString;
    [answerLab sizeToFit];
    
    
    CGFloat LY = answerLab.frame.origin.y+answerLab.frame.size.height+H(20);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(W(15),LY, SC_WIDTH-W(30), H(13))];
    label.font = [UIFont systemFontOfSize:W(13)];
    label.textAlignment = NSTextAlignmentRight;
    label.text = @"张华解答";
    label.textColor = COLORFromRGB(0x333333);
    [self.scrollView addSubview:label];
    
    CGFloat BY = label.frame.origin.y+label.frame.size.height+H(20);
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(BY);
        
    }];
    
    self.scrollView.contentSize = CGSizeMake(SC_WIDTH, BY);
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
