//
//  ZHCameraCall.h
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/9/12.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ZHCameraCall : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate> 
@property (strong ,nonatomic) UIButton *butCamera;//操作摄像头按钮
@property (strong ,nonatomic) UIButton *butPhoto;// 调用相册图片按钮
@property (strong ,nonatomic) UIButton *butPhotoList;// 调用相册图片列表
@property (strong ,nonatomic) UIImageView *imageView;//把相册里面的图片展示在此视图上

@end
