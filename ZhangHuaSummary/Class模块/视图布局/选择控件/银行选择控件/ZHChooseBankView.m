//
//  ZHChooseBankView.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/16.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHChooseBankView.h"
#import "QDPickerModel.h"
//获取屏幕宽高
#define WIDTH self.frame.size.width

#define HEIGHT self.frame.size.height

@interface ZHChooseBankView()<UIImagePickerControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSString *z_bankName;//记录当前银行名称
    UIView *z_chooseView;//背景视图
}

@property (nonatomic,strong)UIPickerView * pickerView;//自定义pickerview
@property (nonatomic,strong)NSMutableArray * dataArray;//保存要展示内容


@end


@implementation ZHChooseBankView
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        [self initPickerDataSource];
        z_bankName = @"中国银行";
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
/**
 初始化选择器数据
 */
- (void)initPickerDataSource{

    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"bankList" ofType:@"plist"];
    NSDictionary *tempDic = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    NSArray *array = tempDic[@"data"];
    
    for (NSDictionary *dic in array) {
        QDPickerModel *model = [[QDPickerModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.dataArray addObject:model];
    }
    
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
- (UIPickerView *)pickerView {
    
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc] init];
        _pickerView.backgroundColor = [UIColor whiteColor];
        _pickerView.dataSource = self;
        _pickerView.delegate = self;
        [_pickerView selectRow:3 inComponent:0 animated:NO];
        [z_chooseView addSubview:_pickerView];
        [_pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(z_chooseView.mas_bottom);
            make.right.left.equalTo(z_chooseView);
            make.height.mas_equalTo(200);
        }];
        
    }
    return _pickerView;
}
/**
 懒加载数组
 */
- (NSMutableArray *)dataArray{
    if (nil == _dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:2];
    }
    return _dataArray;
}

#pragma mark  *** 自定义picker代理方法 ***
//列表数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
//行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return self.dataArray.count;
}
//行宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    
    return WIDTH;
}
//行高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 40;
}
//记录当前选择的那家银行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    QDPickerModel *model = self.dataArray[row];
    z_bankName = model.name;
//    NSLog(@"%@",model.name);
    
    
}
//自定义pickerView的布局
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    view.backgroundColor = [UIColor whiteColor];
    
    if (!view){
        view = [[UIView alloc]init];
    }
    QDPickerModel *model = self.dataArray[row];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(W(100),5,30,30);
    imageView.backgroundColor = [UIColor whiteColor];
    NSURL *imageUrl = [NSURL URLWithString:model.logo];
    [imageView sd_setImageWithURL:imageUrl];
    [view addSubview:imageView];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.font = [UIFont systemFontOfSize:16];
    [nameLabel setTextColor:COLORFromRGB(0x333333)];
    nameLabel.text = model.name;
    nameLabel.frame = CGRectMake(W(100)+40,5,200,16);
    [view addSubview:nameLabel];
    
    UILabel * conditionLabel = [[UILabel alloc] init];
    conditionLabel.textAlignment = NSTextAlignmentLeft;
    [conditionLabel setTextColor:COLORFromRGB(0x666666)];
    conditionLabel.font = [UIFont systemFontOfSize:12];
    conditionLabel.text = model.summ;
    conditionLabel.frame = CGRectMake(W(100)+40,23,200,12);
    [view addSubview:conditionLabel];
    
    return view;
}

/**
 确认选择银行按钮回调block

 */
-(void)getChooseBank:(chooseBankBlock)chooseBank{
    
    self.chooseBankBlock = chooseBank;
}

/**
 银行选择弹出框 确定按钮点击事件
 
 */
- (void)okClick:(UIButton*)btn{

    
    [UIView animateWithDuration:0.5 animations:^{
        z_chooseView.frame = CGRectMake(0, HEIGHT, WIDTH, 240);
        self.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        self.chooseBankBlock(z_bankName);
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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
