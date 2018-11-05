//
//  ZHMD5Controller.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/2/22.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHMD5Controller.h"
#import "ZHMD5.h"
@interface ZHMD5Controller (){
    UITextField *inputField;
    UILabel     *outputLabel;

}

@end
@implementation ZHMD5Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSubView];
    self.view.backgroundColor = [UIColor whiteColor];

    // Do any additional setup after loading the view.
}
- (void)createSubView{
    
    UIButton *button  = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(50, 120, 50, 50);
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button];
    
    inputField = [[UITextField alloc] initWithFrame:CGRectMake(50, 180, 200, 30)];
    inputField.borderStyle = UITextBorderStyleRoundedRect;
    inputField.backgroundColor = COLORFromRGB(0xf9f9f9);
    [self.view addSubview:inputField];
    
    outputLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 220, kScreenWidth-60, 30)];
    outputLabel.backgroundColor = COLORFromRGB(0x666666);
    outputLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:outputLabel];
    

    
}
- (void)buttonPressed:(UIButton *)button{
    
    outputLabel.text = [ZHMD5 md5:inputField.text];
    
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
