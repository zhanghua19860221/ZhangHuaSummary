//
//  ZHWebImageCache.h
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/9/7.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 在协议方法里面对图片缓存
 */
@protocol ZHWebImageDelegate <NSObject>

-(void)refreshUIOperation;

@end

@interface ZHWebImageCache : NSObject
@property (strong, nonatomic) id<ZHWebImageDelegate>delegate;
-(instancetype)initWithCache;
//把WebImage Data数据缓存到本地
-(void)cacheWebImageUrl:(NSString*)url imageName:(NSString*)imageName;
//获取对应路径下的image Data数据
-(NSData*)getLocalCacheImage:(NSString*)imageDataPath;
//获取本地缓存文件路径
-(NSString*)getLocationImageDataFilePath;
//删除缓存文件
-(void)removeImageCacheFile;
//获取缓存文件的大小
- (unsigned long long)getFileSizeAtPath;

@end
