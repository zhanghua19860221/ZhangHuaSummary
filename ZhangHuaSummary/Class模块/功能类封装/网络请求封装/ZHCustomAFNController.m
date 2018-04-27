//
//  ZHCustomAFNController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/4/27.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHCustomAFNController.h"
#import "ZHNetWorking.h"

@interface ZHCustomAFNController ()

@end

@implementation ZHCustomAFNController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self getTableViewSource];
    // Do any additional setup after loading the view.
}

-(void)getTableViewSource{
    //等级
    NSString *url = @"http://101.201.117.15/qd_api/index.php?ctl=qd_supplier&act=myLevel&r_type=1";
//    //正确
//    NSString *auth_session = @"NDN85peg5Li66ICM5rK7fDEzNjAxMTEyMzQ5";
    //错误
    NSString *auth_session = @"NDN85peg5Li66ICM5rK7fDEzNjAxMTEyMzQ533";
    NSDictionary *dic = @{@"auth_session":auth_session};
    
    
    [[ZHNetWorking shareInstance] postOrGetWithType:POST URL:url parameter:dic showHUD:YES success:^(id response) {
        NSLog(@"%@",[self logDic:response]);
        
    } failure:^(NSError *error) {
        
        
    }];
    
}
/**
 把Unicode编码转换为 中文
 */
-(NSString *)logDic:(NSDictionary *)dic {
    if (![dic count]) {
        return nil;
    }
    NSString *tempStr1 =
    [[dic description] stringByReplacingOccurrencesOfString:@"\\u"
                                                 withString:@"\\U"];
    NSString *tempStr2 =
    [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 =
    [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str =
    [NSPropertyListSerialization propertyListWithData:tempData
                                              options:NSPropertyListImmutable
                                               format:NULL
                                                error:NULL];
    return str;
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
