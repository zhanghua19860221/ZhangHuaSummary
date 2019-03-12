//
//  WKWebNativeToH5Controller.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2019/3/5.
//  Copyright © 2019年 zhanghua0221. All rights reserved.
//

#import "WKWebNativeToH5Controller.h"
#import <WebKit/WebKit.h>


@interface WKWebNativeToH5Controller ()<WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler>
@property (nonatomic, strong) WKWebView * webView;

@end

@implementation WKWebNativeToH5Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.backgroundColor = [UIColor grayColor].CGColor;
    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    //WKUserContentController这个类主要用来做native与JavaScript的交互管理
    configuration.userContentController = [WKUserContentController new];
    //添加两处点击事件
    [configuration.userContentController addScriptMessageHandler:self name:@"nativeMethod0"];
    [configuration.userContentController addScriptMessageHandler:self name:@"nativeMethod1"];
    
    //webView设置。
    WKPreferences *preferences = [WKPreferences new];
    preferences.minimumFontSize = 30.0;
    preferences.javaScriptCanOpenWindowsAutomatically = NO;
    configuration.preferences = preferences;
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:configuration];
    //加载本地页面
    NSString *urlStr = [[NSBundle mainBundle] pathForResource:@"index1.html" ofType:nil];
    NSURL *fileURL = [NSURL fileURLWithPath:urlStr];
    [self.webView loadFileURL:fileURL allowingReadAccessToURL:fileURL];
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    [self.view addSubview:self.webView];
    
    //与服务器H5交互
    //    NSString *url = [NSString stringWithFormat:@"https://m.tiedaoshangcheng.com/store_themes/%@/indexapp.html?menu=store&store_id=%@",@"1",@"1"];
    //    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:configuration];
    //    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    //    self.webView.UIDelegate = self;
    //    self.webView.navigationDelegate = self;
    //    [self.view addSubview:_webView];
    
    
    UIButton *nativeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [nativeBtn setTitle:@"点击调起H5 （alerCallback）方法" forState:UIControlStateNormal];
    nativeBtn.frame = CGRectMake(kScreenWidth/2.0-100, kScreenHeight/2.0-100, 200, 50);
    [nativeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [nativeBtn addTarget:self action:@selector(callH5Method:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nativeBtn];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    //截取打开页面的 Url
    NSURL * url = navigationAction.request.URL;
    NSLog(@"%@", url);
    //允许页面加载
    decisionHandler(WKNavigationActionPolicyAllow);
    //不允许页面加载
    //decisionHandler(WKNavigationActionPolicyCancel);
}
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    NSLog(@"%@", message);
    completionHandler();
    
}

/** 原生调起H5方法*/
-(void)callH5Method:(UIButton *)btn{
    NSString *h5Method = [NSString stringWithFormat:@"enshrine('%@')",@"原生调用h5中的alerCallback方法成功"];
    [self.webView evaluateJavaScript:h5Method completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        NSLog(@"%@----%@",result, error);
        
    }];
}

@end
