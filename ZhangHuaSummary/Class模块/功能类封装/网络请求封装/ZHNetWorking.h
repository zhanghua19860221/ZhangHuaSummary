//
//  ZHNetWorking.h
//  ZHNetWork
//
//  Created by 张华 on 2018/4/2.
//  Copyright © 2018年 张华. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ResponseSuccess)(id response);
typedef void(^ResponseFail)(NSError *error);
typedef void(^UploadProgress)(int64_t bytesProgress,
                              int64_t totalBytesProgress);
typedef void(^DownloadProgress)(int64_t bytesProgress,
                                int64_t totalBytesProgress);
typedef NSURLSessionTask URLSessionTask;

/**
 *  请求方式 GET OR POST
 */
typedef enum HttpMethod {
    GET,
    POST
} requestType;


@interface ZHNetWorking : NSObject

/**
 *  获取单利对象
 */
+ (instancetype)shareInstance;


/**
 数据请求

 @param Type 请求类型
 @param url 请求地址
 @param params 请求参数
 @param showHUD 是否显示弹出框
 @param success 请求成功
 @param failure 请求失败
 */
-(void)postOrGetWithType:(requestType)Type URL:(NSString*)url parameter:(NSDictionary*)params showHUD:(BOOL)showHUD success:(ResponseSuccess)success failure:(ResponseFail)failure;



/**
 图片上传(支持多张)

 @param Type 请求类型
 @param url 请求地址
 @param params 请求参数
 @param imageArray 需要上传的UIimage数组
 @param imageNameArray 后台服务器定义的UIimage参数名称
 @param fileNameArray  图片在服务器保存的文件名称(如果不传则以当前时间命名)
 @param uploadProgress 上传进度
 @param success 请求成功
 @param failure 请求失败
 @param showHUD 是否显示弹出框
 */
- (void)uploadImageToSeverTpye:(requestType)Type URL:(NSString *)url parameters:(NSDictionary *)params ImageArray:(NSArray *)imageArray ImageNameArray:(NSArray *)imageNameArray FileNameArray:(NSArray *)fileNameArray progress:(UploadProgress)uploadProgress success:(ResponseSuccess)success failure:(ResponseFail)failure showHUD:(BOOL)showHUD;



/**
 下载文件方法
 
 @param url 下载地址
 @param saveToPath 文件保存的路径,如果不传则保存到Documents目录下，以文件本来的名字命名
 @param loadingImageArr loading图片数组
 @param progressBlock 下载进度回调
 @param success 下载成功
 @param fail 下载失败
 @param showHUD 是否显示HUD
 */
- (void)downloadWithUrl:(NSString *)url saveToPath:(NSString *)saveToPath loadingImageArr:(NSMutableArray *)loadingImageArr progress:(DownloadProgress )progressBlock success:(ResponseSuccess )success failure:(ResponseFail )fail showHUD:(BOOL)showHUD;
@end
