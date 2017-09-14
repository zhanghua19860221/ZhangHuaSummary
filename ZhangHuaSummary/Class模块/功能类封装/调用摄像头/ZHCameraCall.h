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
@property (strong ,nonatomic) UIButton *butVideo;// 调用相册视频按钮

@end
