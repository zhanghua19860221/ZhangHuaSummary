//
//  AppDelegate.m
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/8/23.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

#import "AvoidCrash.h"
#import "NSArray+AvoidCrash.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    RootViewController *rootVc = [[RootViewController alloc]init];
    self.mainNav = [[UINavigationController alloc]initWithRootViewController:rootVc];
    self.window.rootViewController = self.mainNav;

    //友盟分享
    [self youMengShare];
    //防崩溃异常处理集成
    [self integratedAvoidCrash];
    //重力弹出快捷模式
    [self shortCut];
    
    return YES;
}
//重力弹出快捷模式
- (void)shortCut{
    if (IOS9_0_OR_LATER) {
        UIMutableApplicationShortcutItem *incomeShortItem = [[UIMutableApplicationShortcutItem alloc] initWithType:@"income" localizedTitle:@"收入"];
        UIApplicationShortcutIcon *incomeIcon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"list_shouru"];
        incomeShortItem.icon = incomeIcon;
        
        UIMutableApplicationShortcutItem *payoutShortItem = [[UIMutableApplicationShortcutItem alloc] initWithType:@"payout" localizedTitle:@"支出"];
        UIApplicationShortcutIcon *payoutIcon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"list_zhichu"];
        payoutShortItem.icon = payoutIcon;
        
        UIMutableApplicationShortcutItem *transferShortItem = [[UIMutableApplicationShortcutItem alloc] initWithType:@"transfer" localizedTitle:@"转账"];
        UIApplicationShortcutIcon *transferIcon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"list_zhuanzhang"];
        transferShortItem.icon = transferIcon;
        
        [UIApplication sharedApplication].shortcutItems = @[incomeShortItem,payoutShortItem,transferShortItem];
    }
    
}
- (void)youMengShare{
    /* 打开调试日志 */
    [[UMSocialManager defaultManager] openLog:YES];
    
    /* 设置友盟appkey */
    [UMConfigure initWithAppkey:@"5c458bfdb465f5345e000af0" channel:nil];
    
    [self configUSharePlatforms];
    
}
- (void)configUSharePlatforms{
    //微信分享
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wx6cf6e18f37ec2670" appSecret:@"80d9ebfc4fe718c7fea37e70ffb4fb56" redirectURL:nil];
    
    //QQ分享
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1107950083"/*设置QQ平台的appID*/  appSecret:@"s44LVwnQcHVJa5mc" redirectURL:@"nil"];
    
}
// 支持所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}
#pragma make************************* 防止崩溃处理 AvoidCrash 集成 ***************************************

- (void)integratedAvoidCrash{
    //Override point for customization after application launch.
    /*
     *  [AvoidCrash becomeEffective]、[AvoidCrash makeAllEffective]
     *  是全局生效。若你只需要部分生效，你可以单个进行处理，比如:
     *  [NSArray avoidCrashExchangeMethod];
     *  [NSMutableArray avoidCrashExchangeMethod];
     *  .................
     *  .................
     */
    
    //启动防止崩溃功能(注意区分becomeEffective和makeAllEffective的区别)
    //具体区别请看 AvoidCrash.h中的描述
    //建议在didFinishLaunchingWithOptions最初始位置调用 上面的方法
    
    [AvoidCrash becomeEffective];
    
    
    //注意:
    //setupNoneSelClassStringsArr:和setupNoneSelClassStringPrefixsArr:
    //可以同时配合使用
    
    //=============================================
    //   1、unrecognized selector sent to instance
    //=============================================
    
    //若出现unrecognized selector sent to instance并且控制台输出:
    //-[__NSCFConstantString initWithName:age:height:weight:]: unrecognized selector sent to instance
    //你可以将@"__NSCFConstantString"添加到如下数组中，当然，你也可以将它的父类添加到下面数组中
    //比如，对于部分字符串，继承关系如下
    //__NSCFConstantString --> __NSCFString --> NSMutableString --> NSString
    //你可以将上面四个类随意一个添加到下面的数组中，建议直接填入 NSString
    
    NSArray *noneSelClassStrings = @[@"NSString"];
    [AvoidCrash setupNoneSelClassStringsArr:noneSelClassStrings];
    
    
    //=============================================
    //   2、unrecognized selector sent to instance
    //=============================================
    
    //若需要防止某个前缀的类的unrecognized selector sent to instance
    //比如AvoidCrashPerson
    //你可以调用如下方法
    NSArray *noneSelClassPrefix = @[
                                    @"AvoidCrash"
                                    ];
    [AvoidCrash setupNoneSelClassStringPrefixsArr:noneSelClassPrefix];
    
    
    //监听通知:AvoidCrashNotification, 获取AvoidCrash捕获的崩溃日志的详细信息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealwithCrashMessage:) name:AvoidCrashNotification object:nil];
}
- (void)dealwithCrashMessage:(NSNotification *)note {
    //不论在哪个线程中导致的crash，这里都是在主线程
    //注意:所有的信息都在userInfo中
    //你可以在这里收集相应的崩溃信息进行相应的处理(比如传到自己服务器)
    //详细讲解请查看 https://github.com/chenfanfang/AvoidCrash
    //    NSLog(@"错误处理 == %@",note.userInfo[@"defaultToDo"]);
    //    NSLog(@"错误类型 == %@",note.userInfo[@"errorName"]);
    //    NSLog(@"错误位置 == %@",note.userInfo[@"errorPlace"]);
    //    NSLog(@"错误原因 == %@",note.userInfo[@"errorReason"]);
    NSString *crashLog = [NSString stringWithFormat:@"错误处理 == %@\n,错误类型 == %@\n,错误位置 == %@\n,错误原因 == %@\n",note.userInfo[@"defaultToDo"],note.userInfo[@"errorName"],note.userInfo[@"errorPlace"],note.userInfo[@"errorReason"]];
    NSLog(@"错误处理 == %@",crashLog);
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
//重力弹出快捷模式
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    
    //不管APP在后台还是进程被杀死，只要通过主屏快捷操作进来的，都会调用这个方法
    NSLog(@"name:%@\ntype:%@", shortcutItem.localizedTitle, shortcutItem.type);
}
@end
