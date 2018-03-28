//
//  KeyChinaController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/28.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "KeyChinaController.h"
#import "ZHKeyChina.h"
@interface KeyChinaController ()

@end

@implementation KeyChinaController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self saveDataPassWord];
    self.view.backgroundColor = COLORFromRGB(0xffffff);
    // Do any additional setup after loading the view.
}
- (void)saveDataPassWord{
    //相当于表名
    NSString * const KEY_USERNAME_PASSWORD = @"com.company.app.usernamepassword";
    //该表下字典的key值
    NSString * const KEY_USERNAME = @"username";
    NSString * const KEY_PASSWORD = @"password";



    // A、将用户名和密码写入keychain
    NSMutableDictionary *userNamePasswordKVPairs = [NSMutableDictionary dictionary];
    [userNamePasswordKVPairs setObject:@"zhanghua" forKey:KEY_USERNAME];
    [userNamePasswordKVPairs setObject:@"123456" forKey:KEY_PASSWORD];
    
    [ZHKeyChina save:KEY_USERNAME_PASSWORD data:userNamePasswordKVPairs];
    
    
    //B、从keychain中读取用户名和密码
    NSMutableDictionary *readUsernamePassword = (NSMutableDictionary *)[ZHKeyChina load:KEY_USERNAME_PASSWORD];
    NSString *userName = [readUsernamePassword objectForKey:KEY_USERNAME];
    NSString *password = [readUsernamePassword objectForKey:KEY_PASSWORD];
    NSLog(@"username = %@", userName);
    NSLog(@"password = %@", password);
    
    
    
    // C、将用户名和密码从keychain中删除
    [ZHKeyChina delete:KEY_USERNAME_PASSWORD];
    
    
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
