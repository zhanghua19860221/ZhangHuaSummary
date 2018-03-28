//
//  ZHKeyChina.h
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/28.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//
//今天了解一下KeyChina,之前保存的用户信息都放在NSUserDefaults,这样很不安全,现在写的话我会放在KeyChina中,因为他存储的信息还是比较安全的,Keychain的信息是存在于每个应用（app）的沙盒之外的，所以keychain里保存的信息不会因App被删除而丢失，在用户重新安装App后依然有效，数据还在。(就是将一些敏感信息,储存起来);

//接下来我们来简单的集成一下吧,保存用户的账号和密码,还有其他用处,这里并没有介绍:

//集成之前先说一下,KeyChina现在不支持ARC,所以需要我们手动的配置工程,在代码中会有体现,

//首先导入系统的框架:Security.framework
/**
 *  该类需要工作在mrc模式下,如果项目是arc,按照下面进行操作
 *  选中工程->TARGETS->相应的target然后选中右侧的“Build Phases”，向下就找到“Compile Sources”了。然后在相应的文件后面添加:-fno-objc-arc参数
 */

#import <Foundation/Foundation.h>
#import <Security/Security.h>
@interface ZHKeyChina : NSObject
/**
 *  用KeyChaina去保存用户名和密码
 */
+(void)save:(NSString *)service data:(id)data;
/**
 *  从KeyChina取出用户名和密码
 */
+(id)load:(NSString *)service;
/**
 *  从KeyChina中删除用户名和密码
 */
+ (void)delete:(NSString *)service;

@end
