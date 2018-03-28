//
//  PictureCompressionController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/23.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "PictureCompressionController.h"

@interface PictureCompressionController ()
{
    UILabel *label;
    
}

@end

@implementation PictureCompressionController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSubView];

    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
- (void)createSubView{
    UIImageView *imageViwe = [[UIImageView alloc] init];
    [self.view addSubview:imageViwe];
    [imageViwe setImage:[UIImage imageNamed:@"zhanghua"]];
    [imageViwe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY).offset(100);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(140);
        
    }];
    
    label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    [label setTextColor:COLORFromRGB(0xe10000)];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(imageViwe.mas_top).offset(-130);
        make.centerX.equalTo(imageViwe.mas_centerX);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(16);


    }];

    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"点击压缩" forState:UIControlStateNormal];
    [button setTitleColor:COLORFromRGB(0x333333) forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(pictureCompress) forControlEvents:UIControlEventTouchUpInside];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(10);
        make.centerX.equalTo(imageViwe.mas_centerX);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
        
        
    }];
    
    
}
- (void)pictureCompress{
    
    dispatch_queue_t queue= dispatch_queue_create("test.queue", DISPATCH_QUEUE_CONCURRENT);

    dispatch_async(queue , ^{

        UIImage *image = [UIImage imageNamed:@"zhanghua"];
        
        NSData *data = [shareDelegate PictureCompressionImage:image];
        
        //获取的是data的size 单位（kb）
        NSInteger size = data.length/1024;
        
        
        dispatch_async(dispatch_get_main_queue(),^{
            
            label.text = [NSString stringWithFormat:@"%ldKB",size];

        });
        
    });

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
