//
//  ZHCameraAlbumController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/26.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHCameraAlbumController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface ZHCameraAlbumController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIImageView * imageView;

@end

@implementation ZHCameraAlbumController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigation];
    [self addSubviews];
    [self makeConstraintsForUI];    // Do any additional setup after loading the view.
}
#pragma mark - set navigation

- (void)setNavigation {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(selectPhoto:)];
    
}

#pragma mark - add subviews

- (void)addSubviews {
    
    [self.view addSubview:self.imageView];
}

#pragma mark - make constraints

- (void)makeConstraintsForUI {
    __weak typeof(self)weakSelf = self;
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, kScreenWidth));
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
        make.centerY.mas_equalTo(weakSelf.view.mas_centerY);
    }];
    
}
#pragma mark - setter and getter

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = COLORFromRGB(0x666666);
        //        UIViewContentModeScaleToFill,视图大小不变，把图片的一部分不变型展示在视图上
        //        UIViewContentModeScaleAspectFit,把图片拉伸完全展示在_imageView上
        //        UIViewContentModeScaleAspectFill,//视图大小根据图片大小不变型完全展示
        _imageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _imageView;
}


#pragma mark - navitation item action

- (void)selectPhoto:(UIBarButtonItem *)itemCamera {
    
    //创建sheet提示框，提示选择相机还是相册
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"请选择打开方式" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    //相机选项
    UIAlertAction * camera = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //判断相机功能是否可用
        if([self isCameraAvailable] && [self doesCameraSupportTakingPhotos]){
            
            //设置媒体来源，即调用出来的UIImagePickerController所显示出来的界面，有一下三种来源
            [self chooseSourceType:UIImagePickerControllerSourceTypeCamera];
            
        }
        
    }];
    
    //相册选项
    UIAlertAction * photo = [UIAlertAction actionWithTitle:@"相册图片库" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //设置媒体来源，即调用出来的UIImagePickerController所显示出来的界面，有一下三种
        [self chooseSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
        
        
    }];
    
    //相册选项
    UIAlertAction * photoList = [UIAlertAction actionWithTitle:@"相册图片列表" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //设置媒体来源，即调用出来的UIImagePickerController所显示出来的界面，有一下三种
        [self chooseSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        
        
    }];
    
    //取消按钮
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    //添加各个按钮事件
    [alert addAction:camera];
    [alert addAction:photo];
    [alert addAction:photoList];
    [alert addAction:cancel];
    
    //弹出sheet提示框
    [self presentViewController:alert animated:YES completion:nil];
}

//判断功能的选择类型
- (void)chooseSourceType:(UIImagePickerControllerSourceType )menu{
    
    // 初始化图片选择控制器
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    [imagePicker setSourceType:menu];
    
    // 设置可获取的媒体类型，现在可获取视频 和 图片 ，若不需要可去除多余
    NSString *requiredMediaType = ( NSString *)kUTTypeImage;
    
    NSString *requiredMediaTypeOne = ( NSString *)kUTTypeMovie;
    
    NSArray *arrMediaTypes=[NSArray arrayWithObjects:requiredMediaType,requiredMediaTypeOne,nil];
    [imagePicker setMediaTypes:arrMediaTypes];
    
    // 设置是否可以管理已经存在的图片或者视频
    [imagePicker setAllowsEditing:YES];
    
    // 设置代理
    [imagePicker setDelegate:self];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
    //        //查看当前的沙盒目录
    //        NSLog(@"%@+++",NSHomeDirectory());
    
}

#pragma mark - imagePickerController delegate

//不管从相册获取图片 还是 把图片保存到相册 都会调取
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    //    NSString *const UIImagePickerControllerMediaType ;指定用户选择的媒体类型（文章最后进行扩展）
    //    NSString *const UIImagePickerControllerOriginalImage ;原始图片
    //    NSString *const UIImagePickerControllerEditedImage ;修改后的图
    //    NSString *const UIImagePickerControllerCropRect ;裁剪尺寸
    //    NSString *const UIImagePickerControllerMediaURL ;媒体的URL
    //    NSString *const UIImagePickerControllerReferenceURL ;原件的URL
    //    NSString *const UIImagePickerControllerMediaMetadata;当来数据来源是照相机的时候这个值才有效
    
    NSLog(@"Picker returned successfully.");
    NSLog(@"%@---", info);
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    // 判断获取类型：图片
    if ([mediaType isEqualToString:( NSString *)kUTTypeImage]){
        UIImage *theImage = nil;
        // 判断，图片 是否允许 修改
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
                NSLog(@"视频保存成功.");
            }else{
                NSLog(@"error occured while saving the video:%@", error);
            } }];
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}
/**
 保存图片后到相册后，调用的相关方法，查看是否保存成功
 
 */
-(void)imageWasSavedSuccessfully:(UIImage *)paramImage
        didFinishSavingWithError:(NSError *)paramError contextInfo:(void *)paramContextInfo{
    
    if (paramError == nil){
        NSLog(@"图片保存成功.");
        
    } else {
        NSLog(@"Error = %@", paramError);
        
    }
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
        [controller setMediaTypes:mediaTypes];
        [controller setDelegate:self];
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
    
}
/**
 
 @return 检测摄像头是否支持录音
 */
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

