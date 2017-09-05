//
//  ZHPictureCacheClass.h
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/9/4.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHPictureCacheClass : NSObject

@property (strong, nonatomic) NSString *imageDataPath;

/**
 Description

 @param pathFile imageData文件夹名称
 @param imagepath 缓存中每个图片数据的名称
 @return 返回对象
 */
-(instancetype*)initWithPicture:(NSString*)pathFile imagePath:(NSString*)imagepath;
//-(void)saveL
@end
