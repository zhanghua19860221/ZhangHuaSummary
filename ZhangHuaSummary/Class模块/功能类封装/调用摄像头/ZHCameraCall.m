//
//  ZHCameraCall.m
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/9/12.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import "ZHCameraCall.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface ZHCameraCall ()
@end

@implementation ZHCameraCall

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createButtonForPhoto];
    [self createButtonForCamera];
    [self createButtonForPhotoList];
    [self createImageView];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
/**
 调用系统相册按钮
 */
-(void)createButtonForPhoto{

    self.butPhoto = [UIButton buttonWithType:UIButtonTypeCustom];
    self.butPhoto.frame = CGRectMake((self.view.frame.size.width-200)/2.0,100,200,50);
    self.butPhoto.backgroundColor = [UIColor grayColor];
    [self.butPhoto setTitle:@"相册操作按钮" forState:UIControlStateNormal];
    [self.butPhoto addTarget:self action:@selector(butPhotoClick) forControlEvents:UIControlEventTouchUpInside];
    self.butPhoto.layer.cornerRadius = 20;
    self.butPhoto.layer.masksToBounds = YES;
    [self.view addSubview:self.butPhoto];

}
/**
 调用系统摄像头按钮
 */
-(void)createButtonForCamera{
    
    self.butCamera = [UIButton buttonWithType:UIButtonTypeCustom];
    self.butCamera.frame = CGRectMake((self.view.frame.size.width-200)/2.0,160,200,50);
    self.butCamera.backgroundColor = [UIColor grayColor];
    [self.butCamera setTitle:@"摄像头操作按钮" forState:UIControlStateNormal];
    [self.butCamera addTarget:self action:@selector(butCameraClick) forControlEvents:UIControlEventTouchUpInside];
    self.butCamera.layer.cornerRadius = 20;
    self.butCamera.layer.masksToBounds = YES;
    [self.view addSubview:self.butCamera];
    
}
/**
 调用系统相册列表按钮
 */
-(void)createButtonForPhotoList{
  
    self.butPhotoList = [UIButton buttonWithType:UIButtonTypeCustom];
    self.butPhotoList.frame = CGRectMake((self.view.frame.size.width-200)/2.0,220,200,50);
    self.butPhotoList.backgroundColor = [UIColor grayColor];
    [self.butPhotoList setTitle:@"相册列表操作按钮" forState:UIControlStateNormal];
    [self.butPhotoList addTarget:self action:@selector(butPhotoListClick) forControlEvents:UIControlEventTouchUpInside];
    self.butPhotoList.layer.cornerRadius = 20;
    self.butPhotoList.layer.masksToBounds = YES;
    [self.view addSubview:self.butPhotoList];
    

}

/**
 调用相册图片展示imageView
 */
-(void)createImageView{

    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 280, SC_WIDTH, 200)];
    self.imageView.backgroundColor = [UIColor grayColor];
    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.cornerRadius = 10;
    [self.view addSubview:self.imageView];
}

/**
 摄像头操作按钮点击事件
 */
-(void)butCameraClick
{
    // 判断有摄像头，并且支持拍照功能
    if([self isCameraAvailable] && [self doesCameraSupportTakingPhotos]){
        // 初始化图片选择控制器
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        /*设置媒体来源，即调用出来的UIImagePickerController所显示出来的界面，有一下三种来源 
         typedef NS_ENUM(NSInteger, UIImagePickerControllerSourceType) { UIImagePickerControllerSourceTypePhotoLibrary, UIImagePickerControllerSourceTypeCamera, UIImagePickerControllerSourceTypeSavedPhotosAlbum };分别表示：图片列表，摄像头，相机相册*/
        [controller setSourceType:UIImagePickerControllerSourceTypeCamera];
        // 设置所支持的媒体功能，即只能拍照，或则只能录像，或者两者都可以
        NSString *requiredMediaType = ( NSString *)kUTTypeImage;
        NSString *requiredMediaType1 = ( NSString *)kUTTypeMovie;
        NSArray *arrMediaTypes=[NSArray arrayWithObjects:requiredMediaType, requiredMediaType1,nil];
        [controller setMediaTypes:arrMediaTypes];
        // 设置录制视频的质量
        [controller setVideoQuality:UIImagePickerControllerQualityTypeHigh];
        //设置最长摄像时间
        [controller setVideoMaximumDuration:10.f];
        // 设置是否可以管理已经存在的图片或者视频
        [controller setAllowsEditing:YES];
        // 设置代理
        [controller setDelegate:self];
        [self presentViewController:controller animated:YES completion:nil];
    }else {
        NSLog(@"Camera is not available.");
    }
}
/**
 相册操作按钮点击事件
 */
-(void)butPhotoClick{
    // 初始化图片选择控制器
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    /*设置媒体来源，即调用出来的UIImagePickerController所显示出来的界面，有一下三种来源
     typedef NS_ENUM(NSInteger, UIImagePickerControllerSourceType) { UIImagePickerControllerSourceTypePhotoLibrary, UIImagePickerControllerSourceTypeCamera, UIImagePickerControllerSourceTypeSavedPhotosAlbum };分别表示：图片列表，摄像头，相机相册*/
    [controller setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    // 设置所支持的媒体功能，即只能拍照，或则只能录像，或者两者都可以
    NSString *requiredMediaType = ( NSString *)kUTTypeImage;
    NSArray *arrMediaTypes=[NSArray arrayWithObjects:requiredMediaType,nil];
    [controller setMediaTypes:arrMediaTypes];
    // 设置是否可以管理已经存在的图片或者视频
    [controller setAllowsEditing:YES];
    // 设置代理
    [controller setDelegate:self];
    [self presentViewController:controller animated:YES completion:nil];

    NSLog(@"%@+++",NSHomeDirectory());
}
/**
 相册列表操作按钮点击事件
 */
-(void)butPhotoListClick{
    
    // 初始化图片选择控制器
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    /*设置媒体来源，即调用出来的UIImagePickerController所显示出来的界面，有一下三种来源
     typedef NS_ENUM(NSInteger, UIImagePickerControllerSourceType) { UIImagePickerControllerSourceTypePhotoLibrary, UIImagePickerControllerSourceTypeCamera, UIImagePickerControllerSourceTypeSavedPhotosAlbum };分别表示：图片列表，摄像头，相机相册*/
    [controller setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    // 设置所支持的媒体功能，即只能拍照，或则只能录像，或者两者都可以
    NSString *requiredMediaType = ( NSString *)kUTTypeImage;
    NSArray *arrMediaTypes=[NSArray arrayWithObjects:requiredMediaType,nil];
    [controller setMediaTypes:arrMediaTypes];
    // 设置是否可以管理已经存在的图片或者视频
    [controller setAllowsEditing:YES];
    // 设置代理
    [controller setDelegate:self];
    [self presentViewController:controller animated:YES completion:nil];
}
/**
 保存图片后到相册后，调用的相关方法，查看是否保存成功

 @param paramImage <#paramImage description#>
 @param paramError <#paramError description#>
 @param paramContextInfo <#paramContextInfo description#>
 */
-(void)imageWasSavedSuccessfully:(UIImage *)paramImage didFinishSavingWithError:(NSError *)paramError contextInfo:(void *)paramContextInfo{
    
    if (paramError == nil){
        NSLog(@"Image was saved successfully.");
    } else {
        NSLog(@"An error happened while saving the image.");
        NSLog(@"Error = %@", paramError);
    }
}
// 当得到照片或者视频后，调用该方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{

    NSLog(@"Picker returned successfully.");
    NSLog(@"%@---", info);
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    picker.allowsEditing = NO;
    // 判断获取类型：图片
    if ([mediaType isEqualToString:( NSString *)kUTTypeImage]){
        UIImage *theImage = nil;
        // 判断，图片是否允许修改
        if ([picker allowsEditing]){
            //获取用户编辑之后的图像
            theImage = [info objectForKey:UIImagePickerControllerEditedImage];
            // 保存图片到相册中
            SEL selectorToCall = @selector(imageWasSavedSuccessfully:didFinishSavingWithError:contextInfo:);
            
            UIImageWriteToSavedPhotosAlbum(theImage, self,selectorToCall, NULL);
            
        } else {
            // 照片的原数据
            theImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        }
        self.imageView.image = theImage;

        
    }else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie]){
        // 判断获取类型：视频 //获取视频文件的url
        NSURL* mediaURL = [info objectForKey:UIImagePickerControllerMediaURL];
        //创建ALAssetsLibrary对象并将视频保存到媒体库
        // Assets Library 框架包是提供了在应用程序中操作图片和视频的相关功能。相当于一个桥梁，链接了应用程序和多媒体文件。
        ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
        // 将视频保存到相册中
        [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:mediaURL completionBlock:^(NSURL *assetURL, NSError *error) {
            if (!error) {
                NSLog(@"captured video saved with no error.");
            }else{
                NSLog(@"error occured while saving the video:%@", error);
            } }];
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}
// 当用户取消时，调用该方法
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}
// 从相册获取图片和视频数据
- (void)ClickShowPhotoAction:(id)sender{
    if ([self isPhotoLibraryAvailable]){
        UIImagePickerController *controller = [[UIImagePickerController alloc] init]; [controller setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        // 设置类型
        NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
        if ([self canUserPickPhotosFromPhotoLibrary]){
            [mediaTypes addObject:( NSString *)kUTTypeImage];
        }
        if ([self canUserPickVideosFromPhotoLibrary]){
            [mediaTypes addObject:( NSString *)kUTTypeMovie];
        }
        [controller setMediaTypes:mediaTypes]; [controller setDelegate:self];
        // 设置代理
        [self.navigationController presentViewController:controller animated:YES completion:nil];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**

 @return 判断设备是否有摄像头
 */
-(BOOL)isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

/**

 @return 判断设备前摄像头是否可用
 */
-(BOOL)isFrontCameraAvailable{
    
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

/**

 @return 判断设备后摄像头是否可用
 */
-(BOOL)isRearCameraAvailable{
    
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

/**
 @param paramMediaType 拍照
 @param paramSourceType 视频
 @return  判断是否支持的媒体类型

 */
-(BOOL)cameraSupportsMedia:(NSString*)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    __block BOOL result=NO;
    if ([paramMediaType length]==0) {
        NSLog(@"Media type is empty.");
        return NO;
    }
    NSArray*availableMediaTypes=[UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;
        }
    }];
    return result;
/**
 
 @return 检测摄像头是否支持录音
 */
}
-(BOOL)doesCameraSupportShootingVideos{
    /*在此处注意我们要将MobileCoreServices 框架添加到项目中， 然后将其导入：#import <MobileCoreServices/MobileCoreServices.h> 。
     不然后出现错误使用未声明的标识符 'kUTTypeMovie' */
    return [self cameraSupportsMedia:( NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypeCamera];
}

/**

 @return 检测摄像头是否支持拍照
 */
-(BOOL)doesCameraSupportTakingPhotos{
    /*在此处注意我们要将MobileCoreServices 框架添加到项目中， 然后将其导入：#import <MobileCoreServices/MobileCoreServices.h> 。不然后出现错误使用未声明的标识符 'kUTTypeImage' */
    return [self cameraSupportsMedia:( NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}

/**

 @return 检测相册是否可用
 */
-(BOOL)isPhotoLibraryAvailable{
    
    return [UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary];
}

/**

 @return 是否可以在相册中选择 视频
 */
-(BOOL)canUserPickVideosFromPhotoLibrary{
    
    return [self cameraSupportsMedia:( NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

/**

 @return 检测是否可在相册中选着 照片
 */
-(BOOL)canUserPickPhotosFromPhotoLibrary{
    
    return [self cameraSupportsMedia:( NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
