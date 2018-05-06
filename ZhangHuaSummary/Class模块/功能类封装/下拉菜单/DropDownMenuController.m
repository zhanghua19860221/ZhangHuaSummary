//
//  DropDownMenuController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/4/13.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "DropDownMenuController.h"
#import "ZHDropDownMenuView.h"
@interface DropDownMenuController ()<ZHDropDownMenuDelegate>

@end

@implementation DropDownMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    ZHDropDownMenuView * dropdownMenu = [[ZHDropDownMenuView alloc] init];
    [dropdownMenu setFrame:CGRectMake(60, 80, 130, 50)];
    [dropdownMenu setMenuTitles:@[@"选项一",@"选项二",@"选项三",@"选项四",@"选项五",@"选项六",@"选项七"] rowHeight:50];
    dropdownMenu.delegate = self;
    [self.view addSubview:dropdownMenu];
    
    // Do any additional setup after loading the view.
}
#pragma mark - LMJDropdownMenu Delegate

- (void)dropdownMenu:(ZHDropDownMenuView *)menu selectedCellNumber:(NSInteger)number{
    NSLog(@"你选择了：%ld",number);
}

- (void)dropdownMenuWillShow:(ZHDropDownMenuView *)menu{
    NSLog(@"--将要显示--");
}
- (void)dropdownMenuDidShow:(ZHDropDownMenuView *)menu{
    NSLog(@"--已经显示--");
}

- (void)dropdownMenuWillHidden:(ZHDropDownMenuView *)menu{
    NSLog(@"--将要隐藏--");
}
- (void)dropdownMenuDidHidden:(ZHDropDownMenuView *)menu{
    NSLog(@"--已经隐藏--");
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
