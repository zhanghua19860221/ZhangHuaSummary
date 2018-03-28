//
//  ZHFMDBDataModel.h
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/28.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHFMDBDataModel : NSObject
@property (strong ,nonatomic) NSString *type;   //消息类型
@property (strong ,nonatomic) NSString *content;//消息内容
@property (strong ,nonatomic) NSString *remark; //失败原因
@property (strong ,nonatomic) NSString *time;   //消息时间

@end
