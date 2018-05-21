//
//  ZHChooseCityView.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/16.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHChooseCityView.h"

#define PICKERHEIGHT H(200)
#define BGHEIGHT     H(240)

#define HEIGHT self.frame.size.height
#define WIDTH self.frame.size.width

#define KEY_WINDOW_HEIGHT [UIApplication sharedApplication].keyWindow.frame.size.height

@interface ZHChooseCityView ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic, strong) UIPickerView * pickerView;//选择器控件

@property(nonatomic, strong) UIView * bgView;//选择器父视图
@property(nonatomic, strong) UIButton * cancleBtn;//取消按钮
@property(nonatomic, strong) UIButton * sureBtn;//确定按钮


@property(nonatomic, strong) NSArray * provinceArray;//省
@property(nonatomic, strong) NSArray * cityArray;//市
@property(nonatomic, strong) NSArray * areaArray;//区
@property (strong, nonatomic) NSArray *selectedArray;//记录当前选项

@property(nonatomic, strong) NSDictionary *pickerDic;//plist文件数据
@property(nonatomic, strong) NSArray *dataSource;//plist文件数据

@property(nonatomic, assign) NSInteger selected;

@property(nonatomic, copy) NSString * provinceStr;//当前选中的省
@property(nonatomic, copy) NSString * cityStr;//当前选中的市
@property(nonatomic, copy) NSString * areaStr;//当前选中的区

@end

@implementation ZHChooseCityView
#pragma mark -- init
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.selected = 0;
        
        [self initSubviews];//初始化布局
        [self getPickerDatas];//初始化数据
    }
    return self;
}

#pragma mark -- loadSubViews
- (void)initSubviews{
    
    [self addSubview:self.bgView];
    [self.bgView addSubview:self.sureBtn];
    [self.bgView addSubview:self.cancleBtn];
    [self.bgView addSubview:self.pickerView];

    [self showPickerView];
}

- (void)getPickerDatas{
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"];
    self.dataSource = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray * tempArray = [NSMutableArray array];
    
    for (NSDictionary * tempDic in self.dataSource) {
        
        for (int i = 0; i < tempDic.allKeys.count; i ++) {
            [tempArray addObject:tempDic.allKeys[i]];
        }
        
    }
    //省
    self.provinceArray = [tempArray copy];
    //市
    self.cityArray = [self getCityNamesFromProvince:0];
    //区
    self.areaArray = [self getAreaNamesFromCity:0];


}
- (void)updateAddressAtProvince:(NSString *)province city:(NSString *)city area:(NSString *)area {
    
    self.provinceStr = province;
    self.cityStr = city;
    self.areaStr = area;
    if (self.provinceStr) {
        //获得数据后刷新
        [self.pickerView reloadComponent:0];
        for (NSInteger i = 0; i < self.provinceArray.count; i++) {
            NSString *city = self.provinceArray[i];
            if ([city isEqualToString:self.provinceStr]) {
                self.selected = i;
                [self.pickerView selectRow:i inComponent:0 animated:YES];
                break;
            }
        }

        self.cityArray = [self getCityNamesFromProvince:self.selected];
        NSInteger selectArea = 0;
        //获得数据后刷新
        [self.pickerView reloadComponent:1];
        for (NSInteger ii = 0; ii < self.cityArray.count; ii++) {
                NSString *city = self.cityArray[ii];
            if ([city isEqualToString:self.cityStr]) {
                    selectArea = ii;
                NSLog(@"NSInteger == %ld",ii);
                    [self.pickerView selectRow:ii inComponent:1 animated:YES];
                    break;
            }
        }
        
        self.areaArray = [self getAreaNamesFromCity:selectArea];
        //获得数据后刷新
        [self.pickerView reloadComponent:2];
        for (NSInteger iii = 0; iii < self.areaArray.count; iii++) {
            NSString *area = self.areaArray[iii];
            if ([area isEqualToString:self.areaStr]) {
                [self.pickerView selectRow:iii inComponent:2 animated:YES];
                break;
            }
        }

    }
    [self updateAddress];
}
/**
 获取当前选中省所包含的城市
 
 @param row 当前选中的 那个城市
 @return 对应城市数组
 */
- (NSArray *)getCityNamesFromProvince:(NSInteger)row{
    
    NSDictionary * tempDic = [self.dataSource[self.selected] objectForKey:self.provinceArray[self.selected]];
    NSMutableArray * cityArray = [NSMutableArray array];
    for (NSDictionary * valueDic in tempDic.allValues) {
        
        for (int i = 0; i < valueDic.allKeys.count; i ++) {
            [cityArray addObject:valueDic.allKeys[i]];
        }
    }
    return [cityArray copy];
}

/**
 获取当前选中市所包含的 所有区域
 
 @param row 当前选中的 那个城市
 @return 对应区域数组
 */
- (NSArray *)getAreaNamesFromCity:(NSInteger)row{
    
    NSDictionary * tempDic = [self.dataSource[self.selected] objectForKey:self.provinceArray[self.selected]];
    NSArray * array = [NSArray array];
    NSDictionary * dic = tempDic.allValues[row];
    array = [dic objectForKey:self.cityArray[row]];
    return array;
    
}
- (UIButton *)cancleBtn{
    
    if (!_cancleBtn) {
        _cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancleBtn.frame = CGRectMake(W(15), H(5), W(50), BGHEIGHT - PICKERHEIGHT - H(10));
        [_cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        _cancleBtn.titleLabel.font = [UIFont systemFontOfSize:W(12)];
        _cancleBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        _cancleBtn.layer.borderWidth = 0.5;
        _cancleBtn.layer.cornerRadius = 5;
        _cancleBtn.backgroundColor = [UIColor orangeColor];
        [_cancleBtn addTarget:self action:@selector(cancleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancleBtn;
}

- (UIButton *)sureBtn{
    
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sureBtn.frame = CGRectMake(WIDTH - W(60), H(5), W(50), BGHEIGHT - PICKERHEIGHT - H(10));
        [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:W(12)];
        _sureBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        _sureBtn.layer.borderWidth = 0.5;
        _sureBtn.layer.cornerRadius = 5;
        _sureBtn.backgroundColor = [UIColor orangeColor];
        [_sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}
#pragma 懒加载

- (NSArray *)dataSource{
    
    if (!_dataSource) {
        _dataSource = [NSArray array];
    }
    return _dataSource;
}

- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0,HEIGHT,WIDTH, BGHEIGHT)];
        _bgView.backgroundColor = COLORFromRGB(0xf5f5f5);
    }
    return _bgView;
}

- (UIPickerView *)pickerView{
    
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, BGHEIGHT - PICKERHEIGHT, WIDTH, PICKERHEIGHT)];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
        _pickerView.backgroundColor = COLORFromRGB(0xffffff);
    }
    return _pickerView;
}

- (NSArray *)provinceArray{
    
    if (!_provinceArray) {
        _provinceArray = [NSArray array];
    }
    return _provinceArray;
}

- (NSArray *)cityArray{
    
    if (!_cityArray) {
        _cityArray = [NSArray array];
    }
    return _cityArray;
}

- (NSArray *)areaArray{
    
    if (!_areaArray) {
        _areaArray = [NSArray array];
    }
    return _areaArray;
}

#pragma mark -- showPickerView
- (void)showPickerView{
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        _bgView.frame = CGRectMake(0, HEIGHT - BGHEIGHT, WIDTH, BGHEIGHT);
    }];
    
}

- (void)hidePickerView{
    
    [UIView animateWithDuration:0.3 animations:^{
        _bgView.frame = CGRectMake(0, HEIGHT, WIDTH, BGHEIGHT);
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        
    }];
}

#pragma mark -- UIPickerView
/**
 选择器的列数
 
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

/**
 每列有几行
 
 */
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (component == 0) {
        return self.provinceArray.count;
    }else if (component == 1){
        return self.cityArray.count;
    }else if (component == 2){
        return self.areaArray.count;
    }
    return 0;
}

/**
 此方法可以重新对选择器进行布局

 */
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width / 3, 30)];
    label.adjustsFontSizeToFitWidth = YES;
    label.textAlignment = NSTextAlignmentCenter;
    if (component == 0) {
        label.text = self.provinceArray[row];
    }else if (component == 1){
        label.text = self.cityArray[row];
    }else if (component == 2){
        label.text = self.areaArray[row];
    }
    return label;
}


/**
 选择框高度

 */
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return H(40.0);
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {//选择省
        self.selected = row;
        self.cityArray = [self getCityNamesFromProvince:row];
        self.areaArray = [self getAreaNamesFromCity:0];
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:2 animated:YES];

    }else if (component == 1){//选择市
        self.areaArray = [self getAreaNamesFromCity:row];
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:2 animated:YES];
        

    }else if (component == 2){//选择区
        [pickerView reloadComponent:2];
        [pickerView selectRow:row inComponent:2 animated:YES];
    }
    [self updateAddress];

}

/**
 获取当前选中的 省-市-区
 */
- (void)updateAddress {
    self.provinceStr = [self.provinceArray objectAtIndex:[self.pickerView selectedRowInComponent:0]];
    self.cityStr  = [self.cityArray objectAtIndex:[self.pickerView selectedRowInComponent:1]];
    self.areaStr  = [self.areaArray objectAtIndex:[self.pickerView selectedRowInComponent:2]];
    
}
/**
 取消按钮点击事件
 */
- (void)cancleBtnClick{
    [self hidePickerView];
}


/**
 确认按钮点击事件
 */
- (void)sureBtnClick{
    [self hidePickerView];
    if (self.selectedBlock != nil) {
        self.selectedBlock(self.provinceStr,self.cityStr,self.areaStr);
    }
}

/**
 点击屏幕隐藏选择器

 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([touches.anyObject.view isKindOfClass:[self class]]) {
        [self hidePickerView];
    }
}

@end
