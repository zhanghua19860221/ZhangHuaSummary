//
//  ZHKeyChina.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/28.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHKeyChina.h"

@implementation ZHKeyChina
/**
 *  该类需要工作在mrc模式下,如果项目是arc,按照下面进行操作
 *  选中工程->TARGETS->相应的target然后选中右侧的“Build Phases”，向下就找到“Compile Sources”了。然后在相应的文件后面添加:-fno-objc-arc参数
 */

+(NSMutableDictionary *)getKeychinaQuery:(NSString *)service{
    
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:(id)kSecClassGenericPassword, (id)kSecClass, service, (id)kSecAttrService, service, (id)kSecAttrAccount, (id)kSecAttrAccessibleAfterFirstUnlock, (id)kSecAttrAccessible, nil];
    
}

#pragma mark -- 写入
+(void)save:(NSString *)service data:(id)data{
    
    //Get search dictionary
    NSMutableDictionary *keyChinaQuery = [self getKeychinaQuery:service];
    //Delete old item before add new item
    SecItemDelete((CFDictionaryRef)keyChinaQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keyChinaQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((CFDictionaryRef)keyChinaQuery, NULL);
}
#pragma mark -- 读取
+ (id)load:(NSString *)service{
    
    id ret = nil;
    NSMutableDictionary *keychinaQuery = [self getKeychinaQuery:service];
    //Configure the search setting
    //Since in our simple case we are expecting only a single attribute to be returned (the password) we can set the attribute kSecReturnData to kCFBooleanTrue
    [keychinaQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychinaQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychinaQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", service, e);
        } @finally {
        }
    }
    if (keyData)
        CFRelease(keyData);
    return ret;
    
}
#pragma mark -- 删除
+(void)delete:(NSString *)service{
    NSMutableDictionary *keychinaQuery = [self getKeychinaQuery:service];
    SecItemDelete((CFDictionaryRef)keychinaQuery);
}

@end
