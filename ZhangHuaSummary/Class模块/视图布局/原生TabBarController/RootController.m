//
//  RootController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/22.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "RootController.h"
#import "FirstBarController.h"
#import "SecondeBarController.h"
#import "ThirdBarController.h"
@interface RootController ()
{
    
    
}
@property (strong , nonatomic)  UIButton*selectedButton;//记录上一个button
@property (strong , nonatomic)  UIView *rc_tabberView;

@end

@implementation RootController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  creatSubView];
    [self  creatTabBarView];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeTabBar:) name:@"removeTabBar" object:nil];
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showTabBar:) name:@"showTabBar" object:nil];
    
    self.tabBar.hidden = YES;
    

}
//隐藏tabbar
- (void)removeTabBar:(NSNotification *)noti{
    [self.tabBar removeFromSuperview];
    self.rc_tabberView.hidden = YES;
    
}
//隐藏展示tabbar
- (void)showTabBar:(NSNotification *)noti{
    
    self.rc_tabberView.hidden = NO;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]  removeObserver:self  name:@"removeTabBar"  object:nil];
    [[NSNotificationCenter defaultCenter]  removeObserver:self  name:@"showTabBar"    object:nil];
    
}
- (void)creatTabBarView{
    
    NSArray *tabSelImageArray = @[@"收款1",@"消息1",@"我的1",@"我的1"];
    NSArray *tabDafImageArray = @[@"收款2",@"消息2",@"我的2",@"我的2"];
    
    self.rc_tabberView = [[UIView alloc] init];
    self.rc_tabberView.backgroundColor =COLORFromRGB(0xffffff);
    self.rc_tabberView.layer.borderColor = COLORFromRGB(0xe10000).CGColor;
    self.rc_tabberView.layer.borderWidth = 0.4;
    
    CGFloat Y = 0;
    CGFloat HBar = 49;

    
    
    if (SC_HEIGHT == 812) {
        Y = 5;
        HBar = 83;
        self.rc_tabberView.frame = CGRectMake(0, SC_HEIGHT-HBar, SC_WIDTH, HBar);
    }else{
        self.rc_tabberView.frame = CGRectMake(0, SC_HEIGHT-HBar, SC_WIDTH, HBar);
    }
    [self.view addSubview:self.rc_tabberView];
    
    for (int i=0; i<tabSelImageArray.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 100+i;
        button.frame = CGRectMake(i*SC_WIDTH/3.0, Y, SC_WIDTH/3.0, 49);
        
        [self.rc_tabberView addSubview:button];

        if (0==i) {
            button.selected=YES;
            _selectedButton=button;
        }
        [button setImage:[UIImage imageNamed:tabDafImageArray[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:tabSelImageArray[i]] forState:UIControlStateSelected];
        
        [button addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void)selectBtn:(UIButton*)btn{
    
    if (_selectedButton!=btn) {
        _selectedButton.selected=NO;
        btn.selected=YES;
        _selectedButton=btn;
    }
    self.selectedIndex=btn.tag-100;
    
    switch (btn.tag) {
        case 100:
            
            break;
            
        case 101:
            
            break;
        case 102:

            break;
        default:
            break;
    }
    
    
}

-(void)creatSubView{
    
    FirstBarController *first=[[FirstBarController alloc] init];
    UINavigationController*nav=[[UINavigationController alloc] initWithRootViewController:first];
    first.view.backgroundColor = randomColor;
    
    SecondeBarController *seconde=[[SecondeBarController alloc] init];
    seconde.view.backgroundColor = randomColor;

    
    ThirdBarController *third=[[ThirdBarController alloc] init];
    third.view.backgroundColor = randomColor;

    
    self.viewControllers=@[nav,seconde,third];
    
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
