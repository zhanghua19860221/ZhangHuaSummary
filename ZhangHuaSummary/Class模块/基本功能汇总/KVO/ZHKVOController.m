//
//  ZHKVOController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/30.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHKVOController.h"
#import "KVOModel.h"
@interface ZHKVOController ()

/** person */
@property(nonatomic, strong) KVOModel * person;
/** 展示的文字 */
@property(nonatomic, strong) UILabel *personAge;

@end

@implementation ZHKVOController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    //需求,让控制器能够监听到person年龄的变化,并且将最新的年龄显示到界面上去
    KVOModel *person = [KVOModel new];
    person.age = 10;
    self.person = person;
    
    UILabel *personAge = [UILabel new];
    personAge.frame = CGRectMake(100, 100, 200, 200);
    personAge.text = [NSString stringWithFormat:@"%zd",person.age];
    personAge.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:personAge];
    self.personAge = personAge;
    
    [self.person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];

    
    // Do any additional setup after loading the view.
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.person removeObserver:self forKeyPath:@"age"];
    self.person = nil;
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.person.age = 20;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    /** NSLog(@"keyPath=%@,object=%@,change=%@,context=%@",keyPath,object,change,context); keyPath=age,object=<HJPerson: 0x7fe64af086e0>,change={ kind = 1; new = 20; },context=(null)
     */ NSLog(@"keyPath=%@,object=%@,changeNew=%@,changeOld=%@,context=%@",keyPath,object,change[@"new"],change[@"old"],context);
    // 这里需要将NSNumber类型转换为字符串类型
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
    NSString *ageStr = [numberFormatter stringFromNumber:[change objectForKey:@"new"]];
    self.personAge.text = ageStr;

    
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
