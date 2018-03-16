//
//  ZHChooseBankView.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/16.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHChooseBankView.h"
#import "QDPickerModel.h"

@interface ZHChooseBankView()<UIImagePickerControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic,strong)UIPickerView * pickerView;//自定义pickerview
@property (nonatomic,strong)NSMutableArray * dataArray;//保存要展示内容


@end


@implementation ZHChooseBankView
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = COLORFromRGB(0xf9f9f9);
        [self initPickerDataSource];
        [self initView];
        [self addSubview:self.pickerView];
    }
    return self;
}
/**
 初始化选择器数据
 */
- (void)initPickerDataSource{
    NSDictionary *tempDic = @{@"status":@"1000",
                              @"desc": @"Normal Returned",
                              @"data": @[
                                      @{
                                          @"summ": @"单笔5万，日累计20万",
                                          @"name": @"浦发银行(暂不支持)",
                                          @"logo": @"http://oo6o93zxg.bkt.clouddn.com//BankInfo/SPDB.png",
                                          @"numb": @"310290000013"
                                          },
                                      @{
                                          @"summ": @"单笔5万，日累计20万",
                                          @"name": @"工商银行",
                                          @"logo": @"http://oo6o93zxg.bkt.clouddn.com//BankInfo/ICBC.png",
                                          @"numb": @"102100099996"
                                          },
                                      @{
                                          @"summ": @"单笔5万，日累计20万",
                                          @"name": @"农业银行",
                                          @"logo": @"http://oo6o93zxg.bkt.clouddn.com//BankInfo/ABC.png",
                                          @"numb": @"103100000026"
                                          },
                                      @{
                                          @"summ": @"单笔5万，日累计20万",
                                          @"name": @"中国银行",
                                          @"logo": @"http://oo6o93zxg.bkt.clouddn.com//BankInfo/BOC.png",
                                          @"numb": @"104100000004"
                                          },
                                      @{
                                          @"summ": @"单笔5万，日累计20万",
                                          @"name": @"建设银行",
                                          @"logo": @"http://oo6o93zxg.bkt.clouddn.com//BankInfo/CCB.png",
                                          @"numb": @"105100000017"
                                          },
                                      @{
                                          @"summ": @"单笔5万，日累计20万",
                                          @"name": @"交通银行",
                                          @"logo": @"http://oo6o93zxg.bkt.clouddn.com//BankInfo/BCM.png",
                                          @"numb": @"301290000007"
                                          },
                                      @{
                                          @"summ": @"单笔5万，日累计20万",
                                          @"name": @"中信银行",
                                          @"logo": @"http://oo6o93zxg.bkt.clouddn.com//BankInfo/CITIC.png",
                                          @"numb": @"302100011000"
                                          },
                                      @{
                                          @"summ": @"单笔5万，日累计20万",
                                          @"name": @"招商银行",
                                          @"logo": @"http://oo6o93zxg.bkt.clouddn.com//BankInfo/CMB.png",
                                          @"numb": @"308584000013"
                                          },
                                      @{
                                          @"summ": @"单笔5万，日累计20万",
                                          @"name": @"光大银行",
                                          @"logo": @"http://oo6o93zxg.bkt.clouddn.com//BankInfo/CEB.png",
                                          @"numb": @"303100000006"
                                          },
                                      @{
                                          @"summ": @"单笔5万，日累计20万",
                                          @"name": @"华夏银行",
                                          @"logo": @"http://oo6o93zxg.bkt.clouddn.com//BankInfo/HXBANK.png",
                                          @"numb": @"304100040000"
                                          },
                                      @{
                                          @"summ": @"单笔5万，日累计20万",
                                          @"name": @"民生银行",
                                          @"logo": @"http://oo6o93zxg.bkt.clouddn.com//BankInfo/CMBC.png",
                                          @"numb": @"305100000013"
                                          },
                                      @{
                                          @"summ": @"单笔5万，日累计20万",
                                          @"name": @"广发银行",
                                          @"logo": @"http://oo6o93zxg.bkt.clouddn.com//BankInfo/BCM.png",
                                          @"numb": @"306581000003"
                                          },
                                      @{
                                          @"summ": @"单笔5万，日累计20万",
                                          @"name": @"兴业银行",
                                          @"logo": @"http://oo6o93zxg.bkt.clouddn.com//BankInfo/CIB.png",
                                          @"numb": @"309391000011"
                                          },
                                      @{
                                          @"summ": @"单笔5万，日累计20万",
                                          @"name": @"平安银行",
                                          @"logo": @"http://oo6o93zxg.bkt.clouddn.com//BankInfo/PAB.png",
                                          @"numb": @"307584007998"
                                          },
                                      @{
                                          @"summ": @"单笔5万，日累计20万",
                                          @"name": @"恒丰银行(暂不支持)",
                                          @"logo": @"http://oo6o93zxg.bkt.clouddn.com//BankInfo/HF.png",
                                          @"numb": @"315456000105"
                                          },
                                      @{
                                          @"summ": @"单笔5万，日累计20万",
                                          @"name": @"浙商银行(暂不支持)",
                                          @"logo": @"http://oo6o93zxg.bkt.clouddn.com//BankInfo/ZHESHANG.png",
                                          @"numb": @"316331000018"
                                          },
                                      @{
                                          @"summ": @"单笔5万，日累计20万",
                                          @"name": @"渤海银行(暂不支持)",
                                          @"logo": @"http://oo6o93zxg.bkt.clouddn.com//BankInfo/BH.png",
                                          @"numb": @"318110000014"
                                          },
                                      @{
                                          @"summ": @"单笔5万，日累计20万",
                                          @"name": @"邮储银行",
                                          @"logo": @"http://oo6o93zxg.bkt.clouddn.com//BankInfo/PSBC.png",
                                          @"numb": @"403100000004"
                                          },
                                      @{
                                          @"summ": @"单笔5万，日累计20万",
                                          @"name": @"北京银行",
                                          @"logo": @"http://oo6o93zxg.bkt.clouddn.com//BankInfo/BOB.png",
                                          @"numb": @"313100000013"
                                          },
                                      @{
                                          @"summ": @"单笔5万，日累计20万",
                                          @"name": @"上海银行(暂不支持)",
                                          @"logo": @"http://oo6o93zxg.bkt.clouddn.com//BankInfo/BCM.png",
                                          @"numb": @"325290000012"
                                          }
                                      ]
                              };
    NSArray *array = tempDic[@"data"];
    
    for (NSDictionary *dic in array) {
        QDPickerModel *model = [[QDPickerModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.dataArray addObject:model];
    }
    
}
-(void)initView{
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.backgroundColor = COLORFromRGB(0xe10000);
    [cancelBtn setTitleColor:COLORFromRGB(0xffffff) forState:UIControlStateNormal];
    cancelBtn.layer.masksToBounds = YES;
    cancelBtn.layer.cornerRadius = 3;
    [cancelBtn addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [self addSubview:cancelBtn];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5);
        make.left.equalTo(self).offset(15);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(30);
    }];
    UIButton *OKBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    OKBtn.backgroundColor = COLORFromRGB(0xe10000);
    [OKBtn addTarget:self action:@selector(okClick:) forControlEvents:UIControlEventTouchUpInside];
    [OKBtn setTitleColor:COLORFromRGB(0xffffff) forState:UIControlStateNormal];
    [OKBtn setTitle:@"确定" forState:UIControlStateNormal];
    OKBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    OKBtn.layer.masksToBounds = YES;
    OKBtn.layer.cornerRadius = 3;
    [self addSubview:OKBtn];
    [OKBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5);
        make.right.equalTo(self).offset(-15);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(30);
    }];
    
}


/**
 选择器控件懒加载
 */
- (UIPickerView *)pickerView {
    
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0,40, SC_WIDTH, 200/SCALE_Y)];
        _pickerView.backgroundColor = [UIColor whiteColor];
        _pickerView.dataSource = self;
        _pickerView.delegate = self;
        [_pickerView selectRow:3 inComponent:0 animated:NO];
        
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
    
    return SC_WIDTH;
}
//行高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 40;
}
//记录当前选择的那家银行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    QDPickerModel *model = self.dataArray[row];
    NSLog(@"%@",model.name);
    
}
//自定义pickerView的布局
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    view.backgroundColor = [UIColor whiteColor];
    
    if (!view){
        view = [[UIView alloc]init];
    }
    QDPickerModel *model = self.dataArray[row];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(100/SCALE_X,5,30,30);
    imageView.backgroundColor = [UIColor whiteColor];
    NSURL *imageUrl = [NSURL URLWithString:model.logo];
    [imageView sd_setImageWithURL:imageUrl];
    [view addSubview:imageView];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.font = [UIFont systemFontOfSize:16];
    [nameLabel setTextColor:COLORFromRGB(0x333333)];
    nameLabel.text = model.name;
    nameLabel.frame = CGRectMake(100/SCALE_X+40,5,200,16);
    [view addSubview:nameLabel];
    
    UILabel * conditionLabel = [[UILabel alloc] init];
    conditionLabel.textAlignment = NSTextAlignmentLeft;
    [conditionLabel setTextColor:COLORFromRGB(0x666666)];
    conditionLabel.font = [UIFont systemFontOfSize:12];
    conditionLabel.text = model.summ;
    conditionLabel.frame = CGRectMake(100/SCALE_X+40,23,200,12);
    [view addSubview:conditionLabel];
    
    
    return view;
}
/**
 银行选择弹出框 确定按钮点击事件
 
 */
- (void)okClick:(UIButton*)btn{

    
}
/**
 银行选择弹出框 取消按钮点击事件
 
 */
- (void)cancelClick:(UIButton*)btn{
    
    

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
