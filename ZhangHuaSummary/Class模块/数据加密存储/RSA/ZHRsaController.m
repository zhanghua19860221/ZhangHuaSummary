//
//  ZHRsaController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/2/22.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHRsaController.h"

#define kPublicKeyBase64Code @"MIICfzCCAegCCQDZz6O++KPr8zANBgkqhkiG9w0BAQUFADCBgzELMAkGA1UEBhMCWkgxETAPBgNVBAgMCHpoYW5naHVhMREwDwYDVQQHDAh6aGFuZ2h1YTELMAkGA1UECgwCUUQxDTALBgNVBAsMBFFETVkxETAPBgNVBAMMCHpoYW5naHVhMR8wHQYJKoZIhvcNAQkBFhA1MjcxNDA3MzBAcXEuY29tMB4XDTE4MDIyMjAzMDA0NFoXDTI4MDIyMDAzMDA0NFowgYMxCzAJBgNVBAYTAlpIMREwDwYDVQQIDAh6aGFuZ2h1YTERMA8GA1UEBwwIemhhbmdodWExCzAJBgNVBAoMAlFEMQ0wCwYDVQQLDARRRE1ZMREwDwYDVQQDDAh6aGFuZ2h1YTEfMB0GCSqGSIb3DQEJARYQNTI3MTQwNzMwQHFxLmNvbTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEApnamLER1wQNo3At1Ve/t6eYb9H2/oFuHyR6G4Ypt/1tqDrOZt0J/NRmYwVEn015qBCrXRHlpsbh34UPWmZtSIipZ6Zu5Mf539Z6jk5eHlt1pWgYmpM9FayPEOA1F+NRBi5JkYCcp30A+8KpQoemj3MlnTfGcpVJ1DmCGUG8YN9MCAwEAATANBgkqhkiG9w0BAQUFAAOBgQAncWS6jmoKX9Noh8CtylNtjf/djvL04eKh/9cRvodUx9JPFDK0NA/jsKu4Wd3R31NpFIgGBKYB4Y9dEPzOaFX/3b6w4O0z6jCrk/UQAZOuX7VYh16Cix1EG2vZe+M4hwHsk2ZFKxw08NOeeS7Fqp6spyiIqZ8yfPAeSpAWUOCTjg=="

#define kPrivateKeyBase64Code @"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"

@interface ZHRsaController (){
    UITextField    *textField;//输入需要加密的数据文本框
    UIButton   *encryptionBtn;//数据加密点击按钮
    UIButton   *decryptionBtn;//数据解密点击按钮
    UILabel  *encryptionLabel;//加密数据展示
    UILabel  *decryptionLabel;//解密数据展示

    
}

@end

@implementation ZHRsaController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initRSA];
    [self createSubView];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
//初始化RSA 通过 der文件 和 p12文件获取 公钥 私钥
- (void)initRSA{
    
    self.rsa = [[RSA alloc] init];
    //获得公钥base64编码
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"rsa" ofType:@"der"]];
    self.rsa.public_key = [data base64EncodedStringWithWrapWidth:0];
    
    //获得私钥p12的base64编码
    NSData *p12Data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"p" ofType:@"p12"]];
    //密码为证书申请时填写的密码
    [self.rsa loadPrivate_key:[p12Data base64EncodedStringWithWrapWidth:0] password:@"Zhanghua0221"];
}
- (void)createSubView{
    textField = [[UITextField alloc] init];
    textField.placeholder = @"输入加密数据";
    textField.delegate = self;
    //取消输入框首字母默认大写功能
    [textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [textField setAutocorrectionType:UITextAutocorrectionTypeNo];
    textField.textAlignment = NSTextAlignmentLeft;
    textField.font = [UIFont systemFontOfSize:18];
    textField.backgroundColor = COLORFromRGB(0xf9f9f9);
    [textField setTextColor:[UIColor brownColor]];
    textField.frame = CGRectMake(50, 150, 100, 30);
    [self.view addSubview:textField];
    
    
    encryptionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    encryptionBtn.backgroundColor = COLORFromRGB(0xf9f9f9);
    [encryptionBtn setTitle:@"点击加密" forState:UIControlStateNormal];
    [encryptionBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    encryptionBtn.frame = CGRectMake(50, 190, 100, 30);
    [encryptionBtn addTarget:self action:@selector(encryptionClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:encryptionBtn];
    
    encryptionLabel = [[UILabel alloc] init];
    encryptionLabel.font = [UIFont systemFontOfSize:14];
    encryptionLabel.backgroundColor = COLORFromRGB(0x666666);
    [encryptionLabel setTextColor:[UIColor whiteColor]];
    
    //文字居中显示
    encryptionLabel.textAlignment = NSTextAlignmentCenter;
//    //自动折行设置
//    encryptionLabel.lineBreakMode =NSLineBreakByWordWrapping;
    encryptionLabel.numberOfLines = 0;
    [encryptionLabel setTextColor:[UIColor redColor]];
    encryptionLabel.frame = CGRectMake(50, 230, kScreenWidth-60, 30);
    [self.view addSubview:encryptionLabel];

    
    decryptionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    decryptionBtn.backgroundColor = COLORFromRGB(0xf9f9f9);
    [decryptionBtn setTitle:@"点击解密" forState:UIControlStateNormal];
    [decryptionBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [decryptionBtn addTarget:self action:@selector(decryptionClick:) forControlEvents:UIControlEventTouchUpInside];
    decryptionBtn.frame = CGRectMake(50, 350, 100, 30);
    [self.view addSubview:decryptionBtn];
    
    decryptionLabel = [[UILabel alloc] init];
    decryptionLabel.font = [UIFont systemFontOfSize:14];
    decryptionLabel.backgroundColor = COLORFromRGB(0x666666);
    [decryptionLabel setTextColor:[UIColor whiteColor]];
    //文字居中显示
    decryptionLabel.textAlignment = NSTextAlignmentCenter;
    //自动折行设置
    decryptionLabel.lineBreakMode =NSLineBreakByWordWrapping;
    [decryptionLabel setNumberOfLines:0];
    [decryptionLabel setTextColor:[UIColor redColor]];
    decryptionLabel.frame = CGRectMake(50, 390, kScreenWidth-60, 30);
    [self.view addSubview:decryptionLabel];

    
}
//加密按钮点击事件
- (void)encryptionClick:(UIButton*)btn{
    encryptionLabel.text = [self.rsa rsaEncryptString:textField.text];
    CGSize size = [encryptionLabel.text sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(kScreenWidth-60,MAXFLOAT)lineBreakMode:UILineBreakModeWordWrap];
    encryptionLabel.frame = CGRectMake(50,230,size.width,size.height);
    
    NSLog(@"encryptionLabel == %@",encryptionLabel.text);
    
    
}
//解密按钮点击事件
- (void)decryptionClick:(UIButton*)btn{
    
    decryptionLabel.text = [self.rsa rsaDecryptString:encryptionLabel.text];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma **************UITextFieldDelegate**********************

/**
 当输入框开始时触发 ( 获得焦点触发)
 
 */
- (void)textFieldDidBeginEditing:( UITextField*)textField{
    
    
}
/**
 询问输入框是否可以结束编辑 (键盘是否可以收回)
 
 */
- (BOOL)textFieldShouldEndEditing:( UITextField*)textField{
    
    return YES;
}
/**
 当前输入框结束编辑时触发 (键盘收回之后触发)
 
 */
- (void)textFieldDidEndEditing:( UITextField *)textField{
    

}
/**
 当输入框文字发生变化时触发 ( 只有通过键盘输入时 , 文字改变 , 触发 )
 
 */
- (BOOL)textField:( UITextField  *)textField shouldChangeCharactersInRange:(NSRange )range replacementString:( NSString  *)string{
    NSString *tem = [[string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]componentsJoinedByString:@""];
    
    //非空格判断
    if (![string isEqualToString:tem]) {
        
        return NO;
    }
    return YES;
}
/**
 控制当前输入框是否能被编辑
 
 */
- (BOOL)textFieldShouldBeginEditing:( UITextField *)textField{
    
    return YES;
}

/**
 控制输入框清除按钮是否有效 (yes, 有 ;no, 没有)
 
 */
- (BOOL)textFieldShouldClear:( UITextField*)textField{
    
    return YES;
}
/**
 返回按钮
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    
    return YES;
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
