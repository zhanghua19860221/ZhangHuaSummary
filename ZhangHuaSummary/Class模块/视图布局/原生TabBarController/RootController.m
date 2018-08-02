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

@interface RootController (){
    
}
@end

@implementation RootController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self  creatSubView];
    [self  creatTabBarView];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
-(void)creatSubView{
    
    FirstBarController *first = [[FirstBarController alloc] init];
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:first];
    first.view.backgroundColor = randomColor;
    
    SecondeBarController *seconde = [[SecondeBarController alloc] init];
    UINavigationController *secondeNav = [[UINavigationController alloc] initWithRootViewController:seconde];
    seconde.view.backgroundColor = randomColor;
    
    ThirdBarController *third = [[ThirdBarController alloc] init];
    UINavigationController *thirdNav = [[UINavigationController alloc] initWithRootViewController:third];
    third.view.backgroundColor = randomColor;
    self.tabBar.translucent = YES;
    self.viewControllers = @[firstNav,secondeNav,thirdNav];
    
}
- (void)creatTabBarView{
    UITabBar *tabBar = self.tabBar;
    UITabBarItem *item0 = [tabBar.items objectAtIndex:0];
    UITabBarItem *item1 = [tabBar.items objectAtIndex:1];
    UITabBarItem *item2 = [tabBar.items objectAtIndex:2];
    tabBar.tintColor = [UIColor redColor];


    item0.selectedImage = [[UIImage imageNamed:@"shouyedianji"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    item0.image = [[UIImage imageNamed:@"shouye"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item0.title = @"首页";
    
    item1.selectedImage = [[UIImage imageNamed:@"faxiandianji"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    item1.image = [[UIImage imageNamed:@"faxian"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.title = @"发现";
    
    item2.selectedImage = [[UIImage imageNamed:@"wodedianji"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    item2.image = [[UIImage imageNamed:@"wode"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.title = @"我的";

}
//item点击事件

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSLog(@"item == %@",item.title);
    
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
