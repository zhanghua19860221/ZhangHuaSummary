//
//  YouMengShareController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2019/2/13.
//  Copyright © 2019年 zhanghua0221. All rights reserved.
//

#import "YouMengShareController.h"

@interface YouMengShareController ()

@end

@implementation YouMengShareController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLORFromRGB(0xffffff);
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [btn setTitle:@"点击分享" forState:UIControlStateNormal];
    [btn setTitleColor:randomColor forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(W(80));
        make.height.mas_equalTo(W(40));
        
    }];
    
    // Do any additional setup after loading the view.
}
- (void)click:(UIButton *)btn{
    [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_WechatSession),@(UMSocialPlatformType_WechatTimeLine),@(UMSocialPlatformType_QQ),@(UMSocialPlatformType_Qzone)]];
    //显示分享面板
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        [self shareWebPageToPlatformType:platformType];
    }];
}
- (void)shareWebPageToPlatformType:(UMSocialPlatformType) platformType{
    NSString *webUrl = @"https://h5.huanbaoxia.com/goods-15.html";
    NSString *imageUrl = @"http://tiedaoshangcheng.oss-cn-zhangjiakou.aliyuncs.com/statics7138C18648D0448EA0F8298D355FADD4.jpg_300x300";
    NSString *goodsName = @"和正农场山东农家拉面300g柔韧细腻易煮易熟不糊锅山东济南优选";
    switch (platformType) {
        case UMSocialPlatformType_WechatSession:{
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {//已安装
                
            }else{
                
            }
            //微信分享
            [UMShareManege WebSharePlatform:UMSocialPlatformType_WechatSession title:goodsName content:@"欢宝匣家的味道" picture:imageUrl webUrl:webUrl viewControl:self succeed:^(id data) {
                NSLog(@"response data is %@",data);
                //[SVProgressHUD showSuccessWithStatus:@"分享成功"];
                //[self performSelector:@selector(dismissProgress) withObject:nil afterDelay:1];
            }failure:^(NSError *error) {
                NSLog(@"%@",error);
                //[SVProgressHUD showErrorWithStatus:@"分享失败"];
                //[self performSelector:@selector(dismissProgress) withObject:nil afterDelay:1];
            }];
        }break;
        case UMSocialPlatformType_WechatTimeLine:{
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {//已安装
                
            }else{
                
            }
            //微信朋友圈分享
            [UMShareManege WebSharePlatform:UMSocialPlatformType_WechatTimeLine title:goodsName content:@"欢宝匣家的味道" picture:imageUrl webUrl:webUrl viewControl:self succeed:^(id data) {
                NSLog(@"response data is %@",data);
                //[SVProgressHUD showSuccessWithStatus:@"分享成功"];
                //[self performSelector:@selector(dismissProgress) withObject:nil afterDelay:1];
            } failure:^(NSError *error) {
                //NSLog(@"%@",error);
                //[SVProgressHUD showErrorWithStatus:@"分享失败"];
                //[self performSelector:@selector(dismissProgress) withObject:nil afterDelay:1];
                
            }];
            
        }break;
        case UMSocialPlatformType_QQ:{
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqqapi://"]]) {//已安装
                
            }else{
                
            }
            //QQ分享
            [UMShareManege WebSharePlatform:UMSocialPlatformType_QQ title:goodsName content:@"欢宝匣家的味道" picture:imageUrl webUrl:webUrl viewControl:self succeed:^(id data) {
                NSLog(@"response data is %@",data);
                //[SVProgressHUD showSuccessWithStatus:@"分享成功"];
                //[self performSelector:@selector(dismissProgress) withObject:nil afterDelay:1];
            } failure:^(NSError *error) {
                NSLog(@"%@",error);
                //[SVProgressHUD showErrorWithStatus:@"分享失败"];
                //[self performSelector:@selector(dismissProgress) withObject:nil afterDelay:1];
            }];
        }break;
        case UMSocialPlatformType_Qzone:{
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqqapi://"]]) {//已安装
                
            }else{
                
            }
            //QQ空间分享
            [UMShareManege WebSharePlatform:UMSocialPlatformType_Qzone title:goodsName content:@"欢宝匣家的味道" picture:imageUrl webUrl:webUrl viewControl:self succeed:^(id data) {
                NSLog(@"response data is %@",data);
                //[SVProgressHUD showSuccessWithStatus:@"分享成功"];
                //[self performSelector:@selector(dismissProgress) withObject:nil afterDelay:1];
                
            } failure:^(NSError *error) {
                NSLog(@"%@",error);
                //[SVProgressHUD showErrorWithStatus:@"分享失败"];
                //[self performSelector:@selector(dismissProgress) withObject:nil afterDelay:1];
            }];
            
        }break;
        default:
            break;
    }
    
}

//- (void)dismissProgress {
//    [SVProgressHUD dismiss];
//    
//}

@end
