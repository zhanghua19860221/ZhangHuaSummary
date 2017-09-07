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
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//            [weakSelf.delegate refreshUIOperation];
//            
//        });
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
    [self.delegate refreshUIOperation];

}

/**
    获取缓存文件大小
 */
- (float)fileSizeAtPath{
    NSFileManager* manager = [NSFileManager defaultManager];
    NSString *imageDataPath= [self getLocationImageDataFilePath];
    if ([manager fileExistsAtPath:imageDataPath]){
        
        //        //取得一个目录下得所有文件名
        //        NSArray *files = [manager subpathsAtPath:filePath];
        //        NSLog(@"files1111111%@ == %ld",files,files.count);
        //
        //        // 从路径中获得完整的文件名（带后缀）
        //        NSString *exe = [filePath lastPathComponent];
        //        NSLog(@"exeexe ====%@",exe);
        //
        //        // 获得文件名（不带后缀）
        //        exe = [exe stringByDeletingPathExtension];
        //
        //        // 获得文件名（不带后缀）
        //        NSString *exestr = [[files objectAtIndex:1] stringByDeletingPathExtension];
        //        NSLog(@"files2222222%@  ==== %@",[files objectAtIndex:1],exestr);
        
        
        return [[manager attributesOfItemAtPath:imageDataPath error:nil] fileSize];
    }
    return 0;
}
@end
