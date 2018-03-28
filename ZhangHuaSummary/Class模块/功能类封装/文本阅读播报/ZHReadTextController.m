//
//  ZHReadTextController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/22.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHReadTextController.h"
#import <AVFoundation/AVFoundation.h>

@interface ZHReadTextController ()<AVSpeechSynthesizerDelegate>{
    UILabel *label;
    AVSpeechSynthesizer * speechSynthesizer;
}

@end

@implementation ZHReadTextController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self readTextSubView];
    [self startReadText];
    self.view.backgroundColor = [UIColor whiteColor];

    // Do any additional setup after loading the view.
}
- (void)readTextSubView{
    label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:16];
    [label setTextColor:[UIColor grayColor]];
    [self.view addSubview:label];
    label.text = @"山不在高，有仙则名。水不在深，有龙则灵。斯是陋室，惟吾德馨。苔痕上阶绿，草色入帘青。谈笑有鸿儒，往来无白丁。可以调素琴，阅金经。无丝竹之乱耳，无案牍之劳形。南阳诸葛庐，西蜀子云亭，孔子云：何陋之有";
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY).offset(-50);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(SC_WIDTH-150);
        make.height.mas_equalTo(SC_HEIGHT/3.0);

        
    }];
    
}
- (void)startReadText{
    
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:label.text];//需要转换的文字
    
    utterance.rate=0.52;// 设置语速，范围0-1，注意0最慢，1最快；AVSpeechUtteranceMinimumSpeechRate最慢，AVSpeechUtteranceMaximumSpeechRate最快
    
    AVSpeechSynthesisVoice*voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];//设置发音，这是中文普通话
    
    utterance.voice= voice;
    
    speechSynthesizer= [[AVSpeechSynthesizer alloc] init];
    
    [speechSynthesizer speakUtterance:utterance];
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];

    
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
