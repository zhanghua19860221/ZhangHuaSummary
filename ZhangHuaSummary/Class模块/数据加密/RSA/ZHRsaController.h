//
//  ZHRsaController.h
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/2/22.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSA.h"
#import "Base64.h"
@interface ZHRsaController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) RSA *rsa;

@end
