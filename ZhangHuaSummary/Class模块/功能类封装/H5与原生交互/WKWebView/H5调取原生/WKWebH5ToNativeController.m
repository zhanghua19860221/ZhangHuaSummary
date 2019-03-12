//
//  WKWebH5ToNativeController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2019/3/5.
//  Copyright © 2019年 zhanghua0221. All rights reserved.
//

#import "WKWebH5ToNativeController.h"
#import <WebKit/WebKit.h>


@interface WKWebH5ToNativeController ()<WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler>
@property (nonatomic, strong) WKWebView * webView;

@end

@implementation WKWebH5ToNativeController

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
/**
 交互事件
 
 @param userContentController   这个类主要用来做native与JavaScript的交互管理
 
 @param message 交互事件信息
 */
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSLog(@"内容--%@,方法名--%@", message.body[@"body"], message.name);
    if ([message.body[@"body"] isEqualToString:@"方法一"]) {
        NSLog(@"点击方法一");

    }else if ([message.body[@"body"] isEqualToString:@"方法二"]){
        NSLog(@"点击方法二");


    }
}
@end
