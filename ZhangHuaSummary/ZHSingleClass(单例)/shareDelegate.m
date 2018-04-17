//
//  shareDelegate.m
//  Nbber
//
//  Created by 张华 on 15/10/22.
//  Copyright © 2015年 zhanghau. All rights reserved.
//

#import "shareDelegate.h"

@implementation shareDelegate

/**

 @return 获取单例对象
 */
+ (shareDelegate *)sharedManager
{
    static shareDelegate *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
        
    });
    return sharedAccountManagerInstance;
}

/**
 把图片压缩到 1兆以内

 */
+(NSData *)PictureCompressionImage:(UIImage *)image{
    
    if (image == nil) {
        
        return nil;
    }
    //图片小于1M的话直接返回图片二进制
    NSData *dataOne = UIImageJPEGRepresentation(image, 1);
    NSInteger sizeOne = dataOne.length/1024;

    if (sizeOne<1000) {
        return dataOne;

    }
    //循环语句压缩size
    int i = 1;
    while (i < 10) {
        //KSLog(@"我现在第%d次循环压缩",i);
        NSData *data = UIImageJPEGRepresentation(image, 1-0.1*i);
        //KSLog(@"压缩质量后所占的大小=%lu",data.length/1024);
        NSInteger size = data.length/1024;
        
        if(size<1000) {
            return data;
            
            break;
        }else {
            i++;
        }
    }
    return nil;
}
/**
 根据字符串 获取控件高度
 
 @param text 字符串
 @param font 字符串字号
 @param wid  承载字符串控件宽度
 @return控件高度
 */
+ (CGFloat)labelHeightText:(NSString * )text  Font:(float)font Width:(float)wid{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(wid, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil];
    return rect.size.height;
}
@end
