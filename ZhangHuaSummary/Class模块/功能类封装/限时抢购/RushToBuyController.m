//
//  RushToBuyController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/11/5.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "RushToBuyController.h"
#import "ZHLimitBuyView.h"


@interface RushToBuyController (){
    HomeLimitView *limitView;

}
@end

@implementation RushToBuyController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.backgroundColor = [UIColor grayColor].CGColor;
    [self createSubView];
    // Do any additional setup after loading the view.
}
- (void)createSubView{

    limitView = [[HomeLimitView alloc] init];
    [self.view addSubview:limitView];
    limitView.backgroundColor = COLORFromRGB(0xffffff);
    //limitView.limitTime = @"16:30";
    limitView.limitTime = @"16.30";
    //limitView.limitTime = @"-1";
    [limitView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.mas_equalTo(W(200));
        make.height.mas_equalTo(H(17));
    }];
}

@end
