//
//  LabAddPictureController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/10/11.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "LabAddPictureController.h"

@interface LabAddPictureController ()
@property(strong ,nonatomic)UILabel *attrobiuteLabel;

@end

@implementation LabAddPictureController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString  * Str = @"中国人民解放军万岁，中华人民共和国万岁，万岁！";
    self.attrobiuteLabel = [[UILabel alloc] init];
    _attrobiuteLabel.frame = CGRectMake(100, 100, 200, 300);
    _attrobiuteLabel.font = [UIFont systemFontOfSize:W(15)];
    _attrobiuteLabel.text = Str;
    _attrobiuteLabel.numberOfLines = 0;
    [self.view addSubview:_attrobiuteLabel];
    self.attrobiuteLabel.attributedText = [self stringWithUIImage:Str];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSAttributedString *)stringWithUIImage:(NSString *) contentStr {
    // 创建一个富文本
    NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:contentStr];
    // 修改富文本中的不同文字的样式
    [attriStr addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, 5)];
    [attriStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, 5)];
    /** 添加图片到指定的位置 */
    NSTextAttachment *attchImage = [[NSTextAttachment alloc] init];
    // 表情图片
    attchImage.image = [UIImage imageNamed:@"店铺.png"];
    // 设置图片大小
    attchImage.bounds = CGRectMake(0, 0, 40, 15);
    NSAttributedString *stringImage = [NSAttributedString attributedStringWithAttachment:attchImage];
    [attriStr insertAttributedString:stringImage atIndex:2];
    // 设置数字为红色
    /*
    [attriStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(5, 9)];    [attriStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:30] range:NSMakeRange(5, 9)];
     */
    //NSDictionary * attrDict = @{ NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size: 15],                          // NSForegroundColorAttributeName: [UIColor blueColor] };
    //创建 NSAttributedString 并赋值
    //_label02.attributedText = [[NSAttributedString alloc] initWithString: originStr attributes: attrDict];
    NSDictionary * attriBute = @{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:30]};
    [attriStr addAttributes:attriBute range:NSMakeRange(5, 9)];
    // 添加表情到最后一位
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    // 表情图片
    attch.image = [UIImage imageNamed:@"店铺.png"];
    // 设置图片大小
    attch.bounds = CGRectMake(0, 0, 30, 30);
    // 创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    [attriStr appendAttributedString:string];
    return attriStr;
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
