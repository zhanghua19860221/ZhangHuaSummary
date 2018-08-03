//
//  ZHDatePickView.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/8/3.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHDatePickView.h"
#import "PGDatePickManager.h"
//获取屏幕宽高
#define WIDTH self.frame.size.width

#define HEIGHT self.frame.size.height

@interface ZHDatePickView(){
    UIView *z_chooseView;//背景视图

}
@property(strong ,nonatomic)UIDatePicker *datePicker;
@end

@implementation ZHDatePickView
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        [self initView];
        [self pickerView];
        [self changeChooseBlock];
    }
    return self;
}
-(void)changeChooseBlock{
    [UIView animateWithDuration:0.5 animations:^{
        z_chooseView.frame = CGRectMake(0, HEIGHT-240, WIDTH, 240);
        
    } completion:^(BOOL finished) {
        
    }];
    
}

-(void)initView{
    
    z_chooseView = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT, WIDTH, 240)];
    [self addSubview:z_chooseView];
    z_chooseView.backgroundColor = COLORFromRGB(0xf9f9f9);
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(15, 5, 60, 30);
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.backgroundColor = COLORFromRGB(0xe10000);
    [cancelBtn setTitleColor:COLORFromRGB(0xffffff) forState:UIControlStateNormal];
    cancelBtn.layer.masksToBounds = YES;
    cancelBtn.layer.cornerRadius = 3;
    [cancelBtn addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [z_chooseView addSubview:cancelBtn];
    
    
    UIButton *OKBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    OKBtn.backgroundColor = COLORFromRGB(0xe10000);
    OKBtn.frame = CGRectMake(WIDTH-75, 5, 60, 30);
    [OKBtn addTarget:self action:@selector(okClick:) forControlEvents:UIControlEventTouchUpInside];
    [OKBtn setTitleColor:COLORFromRGB(0xffffff) forState:UIControlStateNormal];
    [OKBtn setTitle:@"确定" forState:UIControlStateNormal];
    OKBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    OKBtn.layer.masksToBounds = YES;
    OKBtn.layer.cornerRadius = 3;
    [z_chooseView addSubview:OKBtn];
    
    
}

/**
 选择器控件懒加载
 */
- (UIDatePicker *)pickerView {
    
    if (!_datePicker) {
    //创建一个UIPickView对象
        _datePicker = [[UIDatePicker alloc] init];
        //设置背景颜色
        _datePicker.backgroundColor = COLORFromRGB(0xffffff);
        //datePicker.center = self.center;
        //设置本地化支持的语言（在此是中文)
        _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
        //显示方式是只显示 年 月 日
        _datePicker.datePickerMode = UIDatePickerModeDate;
        [z_chooseView addSubview:_datePicker];
        [_datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(z_chooseView.mas_bottom);
            make.right.left.equalTo(z_chooseView);
            make.height.mas_equalTo(200);
        }];
    }
    return _datePicker;
}

/**
 确认选择银行按钮回调block
 
 */
-(void)getChooseBank:(chooseDateBlock)chooseDate{
    
    self.chooseDateBlock = chooseDate;
}

/**
 银行选择弹出框 确定按钮点击事件
 
 */
- (void)okClick:(UIButton*)btn{
    
    NSDate *date = _datePicker.date;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    [dateFormatter setDateFormat:@"yyyy--MM--dd"];
    NSString *string = [[NSString alloc]init];
    string = [dateFormatter stringFromDate:date];
    
    [UIView animateWithDuration:0.5 animations:^{
        z_chooseView.frame = CGRectMake(0, HEIGHT, WIDTH, 240);
        self.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        self.chooseDateBlock(string);
        self.hidden = YES;
        
    }];
    
}
/**
 银行选择弹出框 取消按钮点击事件
 
 */
- (void)cancelClick:(UIButton*)btn{
    
    [UIView animateWithDuration:0.5 animations:^{
        z_chooseView.frame = CGRectMake(0, HEIGHT, WIDTH, 240);
        self.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        self.hidden = YES;
        
    }];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([touches.anyObject.view isKindOfClass:[self class]]) {
        [UIView animateWithDuration:0.5 animations:^{
            z_chooseView.frame = CGRectMake(0, HEIGHT, WIDTH, 240);
            self.alpha = 0.0;
            
        } completion:^(BOOL finished) {
            self.hidden = YES;
            
        }];
        
    }
}
@end
