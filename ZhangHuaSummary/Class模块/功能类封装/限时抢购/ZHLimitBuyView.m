//
//  ZHLimitBuyView.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2019/2/13.
//  Copyright © 2019年 zhanghua0221. All rights reserved.
//

#import "ZHLimitBuyView.h"

@interface HomeLimitView(){
    UILabel *lab0;
    UILabel *lab1;
    UILabel *lab2;
    UILabel *lab3;
    UILabel *lab4;
    UILabel *lab5;
    UILabel *lab6;
    
    NSUInteger expiresTime;
    NSUInteger nowTime;
    NSDate *date1970;
    NSDateFormatter *dateFormatter;
    NSInteger aDay;
    dispatch_source_t _timer;
    
}

@end
@implementation HomeLimitView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        lab0 = [[UILabel alloc] init];
        lab1 = [[UILabel alloc] init];
        lab2 = [[UILabel alloc] init];
        lab3 = [[UILabel alloc] init];
        lab4 = [[UILabel alloc] init];
        lab5 = [[UILabel alloc] init];
        lab6 = [[UILabel alloc] init];
        [self addSubview:lab0];
        [self addSubview:lab1];
        [self addSubview:lab2];
        [self addSubview:lab3];
        [self addSubview:lab4];
        [self addSubview:lab5];
        [self addSubview:lab6];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    lab0.text = @"限时抢购";
    lab0.font = [UIFont systemFontOfSize:W(14)];
    lab0.textAlignment = NSTextAlignmentRight;
    lab0.textColor = COLORFromRGB(0x4a4a4a);
    [lab0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.mas_left).offset(W(20));
        make.width.mas_equalTo(W(70));
        make.height.mas_equalTo(W(15));
        
    }];
    
    lab1.layer.masksToBounds = YES;
    lab1.layer.cornerRadius = W(3);
    lab1.backgroundColor = COLORFromRGB(0xEB470C);
    lab1.textColor = COLORFromRGB(0xffffff);
    lab1.font = [UIFont systemFontOfSize:W(10)];
    lab1.textAlignment = NSTextAlignmentCenter;
    [lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(lab0.mas_centerY);
        make.left.equalTo(lab0.mas_right).offset(W(20));
        make.width.mas_equalTo(W(20));
        make.height.mas_equalTo(W(17));
        
    }];
    
    lab2.text = @":";
    lab2.font = [UIFont systemFontOfSize:W(10)];
    lab2.textAlignment = NSTextAlignmentCenter;
    lab2.textColor = COLORFromRGB(0xEB470C);
    [lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(lab1.mas_centerY);
        make.left.equalTo(lab1.mas_right);
        make.width.mas_equalTo(W(10));
        make.height.mas_equalTo(W(17));
        
    }];
    
    lab3.layer.masksToBounds = YES;
    lab3.layer.cornerRadius = W(3);
    lab3.font = [UIFont systemFontOfSize:W(10)];
    lab3.textAlignment = NSTextAlignmentCenter;
    lab3.backgroundColor = COLORFromRGB(0xEB470C);
    lab3.textColor = COLORFromRGB(0xffffff);
    [lab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(lab2.mas_centerY);
        make.left.equalTo(lab2.mas_right);
        make.width.mas_equalTo(W(20));
        make.height.mas_equalTo(W(17));
        
    }];
    
    lab4.text = @":";
    lab4.font = [UIFont systemFontOfSize:W(10)];
    lab4.textAlignment = NSTextAlignmentCenter;
    lab4.textColor = COLORFromRGB(0xEB470C);
    [lab4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(lab3.mas_centerY);
        make.left.equalTo(lab3.mas_right);
        make.width.mas_equalTo(W(10));
        make.height.mas_equalTo(W(17));
        
    }];
    
    lab5.layer.masksToBounds = YES;
    lab5.layer.cornerRadius = W(3);
    lab5.font = [UIFont systemFontOfSize:W(10)];
    lab5.textAlignment = NSTextAlignmentCenter;
    lab5.backgroundColor = COLORFromRGB(0xEB470C);
    lab5.textColor = COLORFromRGB(0xffffff);
    [lab5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(lab4.mas_centerY);
        make.left.equalTo(lab4.mas_right);
        make.width.mas_equalTo(W(20));
        make.height.mas_equalTo(W(17));
        
    }];
    
}
- (void)setLimitTime:(NSString *)limitTime{
    if (_limitTime != limitTime) {
        _limitTime = limitTime;
    }
    //已当前24点为结束时间节点
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *now = [NSDate date];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
    NSDate *startDate = [calendar dateFromComponents:components];
    NSTimeInterval second =[startDate timeIntervalSince1970];
    
    if ([_limitTime isEqualToString:@"-1"]) {//以24点结束
        NSString *starTimer = [NSString stringWithFormat:@"%.0f", (second+86400)];
        [self countDownTimer:starTimer];
        
    }else{//以给定的时间节点结束
        CGFloat seckill_start_time = [limitTime floatValue];
        NSString *starTimer = [NSString stringWithFormat:@"%.0f", (second+seckill_start_time*3600)];
        [self countDownTimer:starTimer];
    }
}


#pragma mark ****************************** 倒计时时间 ******************************
- (void)countDownTimer:(NSString *)endTimer{
    date1970 = [NSDate dateWithTimeIntervalSince1970:0];
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH mm ss"];
    aDay = 86399;
    expiresTime = 0;
    nowTime = 0;
    
    // 从1970年到现在的时间（秒）
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval second =[dat timeIntervalSince1970];
    NSString *starTimer = [NSString stringWithFormat:@"%.0f", second];
    
    expiresTime = endTimer.integerValue;
    nowTime = starTimer.integerValue;
    
    
    __block NSUInteger timeout= expiresTime; //倒计时时间
    NSString *curStr = [self homeLimitTimeString];
    [self labelValueHandler:curStr];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=starTimer.longLongValue){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
            });
        }else{
            NSString *curStr1 = [self homeLimitTimeString];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self labelValueHandler:curStr1];
            });
            
            timeout--;
        }
    });
    dispatch_resume(_timer);
}
-(NSString*)homeLimitTimeString{
    
    NSTimeInterval timeActualValue;
    if (expiresTime<nowTime) {
        return @"00 00 00";
    }
    NSTimeInterval diffTime  = expiresTime - nowTime;
    //NSLog(@"%ld",(expiresTime - nowTime)/3600/24);
    /// 这里可以设置天数
    timeActualValue = diffTime;
    nowTime++;
    
    NSDate *curDate = [date1970 dateByAddingTimeInterval:timeActualValue];
    NSTimeZone *zone =  [NSTimeZone timeZoneWithAbbreviation:@"GMT-0800"];
    NSInteger interval = [zone secondsFromGMTForDate: curDate];
    NSDate *localeDate = [curDate  dateByAddingTimeInterval: interval];
    NSString *destDateString = [dateFormatter stringFromDate:localeDate];
    
    return destDateString;
}
-(void)labelValueHandler:(NSString*)text{
    NSArray *titleArr = [text componentsSeparatedByString:@" "];
    lab1.text = titleArr[0];
    lab3.text = titleArr[1];
    lab5.text = titleArr[2];
}

@end
