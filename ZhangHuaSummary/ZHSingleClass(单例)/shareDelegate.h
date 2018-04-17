//
//  shareDelegate.h
//  Nbber
//
//  Created by 张华 on 15/10/22.
//  Copyright © 2015年 zhanghau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface shareDelegate : NSObject

+ (shareDelegate *)sharedManager;

/**
 把图片压缩到 1兆以内
 
 */
+(NSData *)PictureCompressionImage:(UIImage *)image;

/**
 
 根据字符串 获取控件高度
 */
+ (CGFloat)labelHeightText:(NSString * ) text Font:(float) font Width:(float)wid;

@end
