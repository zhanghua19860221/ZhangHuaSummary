//
//  ZHNetWorking.m
//  ZHNetWork
//
//  Created by 张华 on 2018/4/2.
//  Copyright © 2018年 张华. All rights reserved.
//
#import "ZHNetWorking.h"
#import "AFHTTPSessionManager.h"
#import "SVProgressHUD.h"

//网络请求超时时间设置
#define TIMEOUT 15.0

//HUD显示时间设置
#define DELAYTIME 1.5


@interface ZHNetWorking ()
@property (nonatomic, strong) AFHTTPSessionManager *httpsManager;

@end

@implementation ZHNetWorking

+ (instancetype)shareInstance{
    static ZHNetWorking *sharedObject =  nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        sharedObject = [[ZHNetWorking alloc] init];
    });
    
    return sharedObject;
}
#pragma mark  初始化
- (instancetype)init{
    self = [super init];
    if (self) {
        
        self.httpsManager = [AFHTTPSessionManager manager];
        self.httpsManager.responseSerializer=[AFJSONResponseSerializer serializer];
        self.httpsManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        [self.httpsManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        self.httpsManager.requestSerializer.timeoutInterval = TIMEOUT;
        [self.httpsManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        
        self.httpsManager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",@"text/html",@"text/json",@"text/plain",@"text/javascript",@"text/xml",@"image/*"]];
        
    }
    return self;
}
/**
 
 MAIN
 */
-(void)postOrGetWithType:(requestType)Type URL:(NSString*)url parameter:(NSDictionary*)params showHUD:(BOOL)showHUD success:(ResponseSuccess)success failure:(ResponseFail)failure{
        
    if (url==nil) {
        return ;
    }
    //检查地址中是否有中文 (如果有的话转换为Encode编码)
    NSString *urlStr= [self strUTF8Encoding:url];
    
    if (showHUD) {
        CCPLog(@"显示提示框");
        //定义HUD样式
        [self customHUD];
        //展示HUD
        [SVProgressHUD show];
    }
    if (Type == GET) {
        [self get:GET URL:urlStr parameter:params showHUD:showHUD success:success failure:failure];
        
    }else if (Type == POST){
        [self post:POST URL:urlStr parameter:params showHUD:showHUD success:success failure:failure];
        
    }
}


- (void)uploadImageToSeverTpye:(requestType)Type URL:(NSString *)url parameters:(NSDictionary *)params ImageArray:(NSArray *)imageArray ImageNameArray:(NSArray *)imageNameArray FileNameArray:(NSArray *)fileNameArray progress:(UploadProgress)upProgress success:(ResponseSuccess)success failure:(ResponseFail)failure showHUD:(BOOL)showHUD{
    
    if (url==nil) {
        return ;
    }
    //检查地址中是否有中文 (如果有的话转换为Encode编码)
    NSString *urlStr= [self strUTF8Encoding:url];
    
    if (showHUD) {
        CCPLog(@"显示提示框");
        //定义HUD样式
        [self customHUD];
        //展示HUD
        [SVProgressHUD show];
    }
    
    [self.httpsManager POST:urlStr parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (int i = 0; i < imageArray.count; i ++) {
            
            UIImage *image = (UIImage *)imageArray[i];
            NSData *imageData = UIImageJPEGRepresentation(image,1.0);
            
            NSString *imageFileName = nil;
            if (fileNameArray != nil) {
                imageFileName = (NSString *)fileNameArray[i];
                if (imageFileName.length == 0) {
                    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                    formatter.dateFormat = @"yyyyMMddHHmmss";
                    NSString *str = [formatter stringFromDate:[NSDate date]];
                    imageFileName = [NSString stringWithFormat:@"%@.png", str];
                }
            }else{
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                formatter.dateFormat = @"yyyyMMddHHmmss";
                NSString *str = [formatter stringFromDate:[NSDate date]];
                imageFileName = [NSString stringWithFormat:@"%@.png", str];
            }

            NSString *nameString = (NSString *)imageNameArray[i];
            
            [formData appendPartWithFileData:imageData name:nameString fileName:imageFileName mimeType:@"image/png"];
            
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        // 上传进度completedUnitCount  总进度totalUnitCount
        if (upProgress) {
            upProgress(uploadProgress.completedUnitCount, uploadProgress.totalUnitCount);
            
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
        if ([responseObject[@"status"] isEqualToString:@"0"]) {
            if (showHUD) {
                [SVProgressHUD showErrorWithStatus:responseObject[@"info"]];
                [self performSelector:@selector(dismissprogress) withObject:nil afterDelay:DELAYTIME];
            }
        }
        if (showHUD) {
            [self performSelector:@selector(dismissprogress) withObject:nil afterDelay:DELAYTIME];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(error.code == -1001){
            if (showHUD) {
                [SVProgressHUD showErrorWithStatus:@"网络请求超时,请重新尝试"];
                [self performSelector:@selector(dismissprogress) withObject:nil afterDelay:DELAYTIME];
            }
            return ;
        }
        //请求失败的原因
        NSData *data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        if (data !=NULL) {
            NSDictionary *dicJSon=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            NSString *string = dicJSon[@"detail"];
            NSLog(@"获取到失败原因 == %@",string);
            if (showHUD) {
                [SVProgressHUD showErrorWithStatus:string];
                [self performSelector:@selector(dismissprogress) withObject:nil afterDelay:DELAYTIME];
            }
            
        }
        
    }];

    
}

- (void)downloadWithUrl:(NSString *)url saveToPath:(NSString *)saveToPath loadingImageArr:(NSMutableArray *)loadingImageArr progress:(DownloadProgress )progressBlock success:(ResponseSuccess )success failure:(ResponseFail )fail showHUD:(BOOL)showHUD{
    
    if (url==nil) {
        return ;
    }
    //检查地址中是否有中文 (如果有的话转换为Encode编码)
    NSString *urlStr= [self strUTF8Encoding:url];
    
    if (showHUD) {
        CCPLog(@"显示提示框");
        //定义HUD样式
        [self customHUD];
        //展示HUD
        [SVProgressHUD show];
    }
    
    NSURLRequest *downloadRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    
    [self.httpsManager downloadTaskWithRequest:downloadRequest progress:^(NSProgress * _Nonnull downloadProgress) {
        
        CCPLog(@"下载进度--%.1f",1.0 * downloadProgress.completedUnitCount/downloadProgress.totalUnitCount);
        
        //回到主线程刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            if (progressBlock) {
                
                progressBlock(downloadProgress.completedUnitCount, downloadProgress.totalUnitCount);
            }
        });
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        //如果没有传入保存路径默认存入沙盒目录
        if (!saveToPath) {
            NSURL *downloadURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
            
            CCPLog(@"默认路径--%@",downloadURL);
            
            return [downloadURL URLByAppendingPathComponent:[response suggestedFilename]];
            
        }else{
            
            return [NSURL fileURLWithPath:saveToPath];
        }
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if(error.code == -1001){
            if (showHUD) {
                [SVProgressHUD showErrorWithStatus:@"网络请求超时,请重新尝试"];
                [self performSelector:@selector(dismissprogress) withObject:nil afterDelay:DELAYTIME];
            }
            return ;
        }
        //请求失败的原因
        NSData *data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        if (data !=NULL) {
            NSDictionary *dicJSon=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            NSString *string = dicJSon[@"detail"];
            NSLog(@"获取到失败原因 == %@",string);
            if (showHUD) {
                [SVProgressHUD showErrorWithStatus:string];
                [self performSelector:@selector(dismissprogress) withObject:nil afterDelay:DELAYTIME];
            }
            
        }

    }];

}



/**
 
 GET
 */
-(void)get:(requestType)Type URL:(NSString*)url parameter:(NSDictionary*)params showHUD:(BOOL)showHUD success:(ResponseSuccess)success failure:(ResponseFail)failure{
    
    [self.httpsManager GET:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        success(responseObject);
        if (![responseObject[@"status"] isEqualToString:@"1"]) {
            if (showHUD) {
                [SVProgressHUD showErrorWithStatus:responseObject[@"info"]];
                [self performSelector:@selector(dismissprogress) withObject:nil afterDelay:DELAYTIME];
            }
        }
        if (showHUD) {
            [self performSelector:@selector(dismissprogress) withObject:nil afterDelay:DELAYTIME];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(error.code == -1001){
            if (showHUD) {
                [SVProgressHUD showErrorWithStatus:@"网络请求超时,请重新尝试"];
                [self performSelector:@selector(dismissprogress) withObject:nil afterDelay:DELAYTIME];
            }
            return ;
        }
        //请求失败的原因
        NSData *data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        if (data !=NULL) {
            NSDictionary *dicJSon=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            NSString *string = dicJSon[@"detail"];
            NSLog(@"获取到失败原因 == %@",string);
            if (showHUD) {
                [SVProgressHUD showErrorWithStatus:string];
                [self performSelector:@selector(dismissprogress) withObject:nil afterDelay:DELAYTIME];
            }
            
        }
    }];
    
    
}
/**
 
 POST
 */
-(void)post:(requestType)Type URL:(NSString*)url parameter:(NSDictionary*)params showHUD:(BOOL)showHUD success:(ResponseSuccess)success failure:(ResponseFail)failure{
    
    [self.httpsManager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        if (![responseObject[@"status"] isEqualToString:@"1"]) {
            if (showHUD) {
                [SVProgressHUD showErrorWithStatus:responseObject[@"info"]];
                [self performSelector:@selector(dismissprogress) withObject:nil afterDelay:DELAYTIME];
            }
        }
        if (showHUD) {
            [self performSelector:@selector(dismissprogress) withObject:nil afterDelay:DELAYTIME];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(error.code == -1001){
            if (showHUD) {
                [SVProgressHUD showErrorWithStatus:@"网络请求超时,请重新尝试"];
                [self performSelector:@selector(dismissprogress) withObject:nil afterDelay:DELAYTIME];
            }
            return ;
        }
        //请求失败的原因
        NSData *data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        if (data !=NULL) {
            NSDictionary *dicJSon=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            NSString *string = dicJSon[@"detail"];
            NSLog(@"获取到失败原因 == %@",string);

            if (showHUD) {
                [SVProgressHUD showErrorWithStatus:string];
                [self performSelector:@selector(dismissprogress) withObject:nil afterDelay:DELAYTIME];
            }
            
        }
    }];
}

/**
 
 自定义设置HUD
 */
- (void)customHUD{
    //    typedef NS_ENUM(NSInteger, SVProgressHUDStyle) {
    //        SVProgressHUDStyleLight,
    //        SVProgressHUDStyleDark,
    //        SVProgressHUDStyleCustom
    //    }
    //只有当 setDefaultStyle == SVProgressHUDStyleCustom时才可以设置 setBackgroundColor的背景色
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setBackgroundColor:[UIColor brownColor]];
    
}

/**
 
 隐藏HUD
 */
- (void)dismissprogress{
    [SVProgressHUD dismiss];
    
}

/**
 
 格式化url
 */
-(NSString *)strUTF8Encoding:(NSString *)str{
    return [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}
@end
