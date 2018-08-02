//
//  ZHSegmentedControl.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/8/2.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHSegmentedControl.h"

@interface ZHSegmentedControl ()

@end

@implementation ZHSegmentedControl
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //先生成存放标题的数据
    NSArray *array = [NSArray arrayWithObjects:@"家具",@"灯饰",@"建材",@"装饰", nil];
    //初始化UISegmentedControl
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:array];
    //设置frame
    segment.frame = CGRectMake(10, 100, self.view.frame.size.width-20, 30);
    //添加到视图
    [self.view addSubview:segment];
    
    //    //添加一个分段(在指定下标下插入,并设置动画效果)
    //    [segment insertSegmentWithTitle:@"12312321" atIndex:0 animated:NO];
    //    //插入图片分段
    [segment insertSegmentWithImage:[UIImage imageNamed:@"1.png"] atIndex:0 animated:YES];
    //    //移除一个分段(根据下标)
    //    [segment removeSegmentAtIndex:0 animated:YES];
    
    //根据下标修改分段标题(修改下标为2的分段)
    [segment setTitle:@"巧克力" forSegmentAtIndex:2];
    [segment setTitle:@"123" forSegmentAtIndex:0];
    
    //根据内容定分段宽度
    segment.apportionsSegmentWidthsByContent = YES;
    //开始时默认选中下标(第一个下标默认是0)
    segment.selectedSegmentIndex = 2;
    //控件渲染色(也就是外观字体颜色)
    segment.tintColor = [UIColor redColor];
    //按下是否会自动释放：
    //    segment.momentary = YES;
    //设置下标为3的segment不可用
    [segment setEnabled:NO forSegmentAtIndex:3];
    
    //设置Segment的字体
    NSDictionary *dic = @{
                          //1.设置字体样式:例如黑体,和字体大小
                          NSFontAttributeName:[UIFont systemFontOfSize:20],
                          //2.字体颜色
                          NSForegroundColorAttributeName:[UIColor redColor]
                          };
    [segment setTitleTextAttributes:dic forState:UIControlStateNormal];
    [segment addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    
    
    
}
//点击不同分段就会有不同的事件进行相应
-(void)change:(UISegmentedControl *)sender{
    NSLog(@"测试");
    if (sender.selectedSegmentIndex == 0) {
        NSLog(@"1");
        
    }else if (sender.selectedSegmentIndex == 1){
        NSLog(@"2");
        
    }else if (sender.selectedSegmentIndex == 2){
        NSLog(@"3");
        
    }else if (sender.selectedSegmentIndex == 3){
        NSLog(@"4");
        
    }
    
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
