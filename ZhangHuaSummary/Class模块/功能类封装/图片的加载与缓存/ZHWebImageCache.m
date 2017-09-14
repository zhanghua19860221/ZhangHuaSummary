//
//  ZHWebImageCache.m
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/9/7.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import "ZHWebImageCache.h"

@implementation ZHWebImageCache

-(instancetype)initWithCache{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(void)cacheWebImageUrl:(NSString*)url imageName:(NSString*)imageName{

    dispatch_queue_t queue= dispatch_queue_create("test.queue", DISPATCH_QUEUE_CONCURRENT);
    __weak typeof(self) weakSelf = self;
    dispatch_async(queue, ^{
        
        NSURL *imageUrl = [NSURL URLWithString:url];
        NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
        [weakSelf saveImageData:imageData imageName:imageName];
        
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [weakSelf.delegate refreshUIOperation];
                
            });

    });
}
/**
 在沙盒中创建缓存文件夹
 
 @return 本地缓存文件夹路径
 */
-(NSString*)getLocationImageDataFilePath{
    // 获得沙盒cache文件夹路径
    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    // 创建文件管理对象
    NSFileManager *imgFile = [NSFileManager defaultManager];
    
    // 在cache文件夹下面创建一个新的文件夹并取名为imageDataFile
    cachesPath = [cachesPath stringByAppendingPathComponent:@"ZHWebImageCacheFile"];
    
    // 判断此路径下是否存在此同名文件 没有就创建
    if(![imgFile fileExistsAtPath:cachesPath]){
        
        [imgFile createDirectoryAtPath:cachesPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return cachesPath;
}
/**
 把图片Data数据保存到沙盒缓存文件目录下
 
 @param imageData 图片数据
 @param imageName 文件夹下创建的 imageData文件名称
 */
-(void)saveImageData:(NSData*)imageData imageName:(NSString*)imageName{
    
    NSString *imageDataPath= [[self getLocationImageDataFilePath] stringByAppendingPathComponent:imageName];
    [imageData writeToFile:imageDataPath atomically:YES];
    
}
/**
 读取沙盒缓存文件下该路径下的图片数据
 
 @param imageDataPath 本地图片文件路径
 @return 返回路径对应的本地Data图片数据
 */
-(NSData*)getLocalCacheImage:(NSString*)imageDataPath{
    
    NSData *imageData = [NSData dataWithContentsOfFile:imageDataPath];
    return imageData;
    
}
/**
 清除沙盒缓存文件
 */
-(void)removeImageCacheFile{
    
    NSFileManager *managar = [NSFileManager defaultManager];
    NSString *imageDataPath= [self getLocationImageDataFilePath];
    [managar removeItemAtPath:imageDataPath error:nil];
}

/**
    获取缓存文件夹大小
 */
-(unsigned long long)getFileSizeAtPath
 {
     // 总大小
     unsigned long long size = 0;

     // 文件管理者
     NSFileManager *mgr = [NSFileManager defaultManager];

     // 是否为文件夹
     BOOL isDirectory = NO;

     // 路径是否存在
     BOOL exists = [mgr fileExistsAtPath:[self getLocationImageDataFilePath] isDirectory:&isDirectory];
     if (!exists) return size;

     if (isDirectory) { // 文件夹
         // 获得文件夹的大小  == 获得文件夹中所有文件的总大小
         NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:[self getLocationImageDataFilePath]];
         for (NSString *subpath in enumerator) {
             // 全路径
             NSString *fullSubpath = [[self getLocationImageDataFilePath] stringByAppendingPathComponent:subpath];
             // 累加文件大小
             size += [mgr attributesOfItemAtPath:fullSubpath error:nil].fileSize;
         }
     } else { // 文件
         size = [mgr attributesOfItemAtPath:[self getLocationImageDataFilePath] error:nil].fileSize;
     }
 
     return size;
 }
@end
