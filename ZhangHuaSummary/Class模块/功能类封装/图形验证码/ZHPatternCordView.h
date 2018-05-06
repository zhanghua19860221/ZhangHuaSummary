//
//  ZHPatternCordView.h
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/4/13.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ZHPatternCodeBlock)(NSString *codeStr);
@interface ZHPatternCordView : UIView

@property (nonatomic, strong) NSString *imageCodeStr;
@property (nonatomic, assign) BOOL isRotation;
@property (nonatomic, copy) ZHPatternCodeBlock bolck;

-(void)freshVerCode;


@end
