//
//  ZHDrawerRootController.m
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/8/29.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import "ZHDrawerRootController.h"

@interface ZHDrawerRootController ()

@end

@implementation ZHDrawerRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addsubController];
    [self createButton];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
-(void)addsubController{
    
    self.left = [[LeftViewController alloc] init];
    self.left.view.frame = CGRectMake(0, 0,SC_WIDTH,SC_HEIGHT);
    self.left.view.backgroundColor = [UIColor colorWithPatternImage:[self createBackgroundImage:@"leftImage.jpg"]];
//    self.left.view.contentMode = UIViewContentModeScaleAspectFit;
    
    self.mid  = [[MidViewController alloc] init];
    self.mid.view.frame = CGRectMake(0, 0,SC_WIDTH,SC_HEIGHT);
    self.mid.view.backgroundColor = [UIColor colorWithPatternImage:[self createBackgroundImage:@"mid.jpg"]];
//    self.mid.view.contentMode = UIViewContentModeScaleAspectFit;
    
    self.right = [[RightViewController alloc] init];
    self.right.view.frame = CGRectMake(0, 0,SC_WIDTH,SC_HEIGHT);
    self.right.view.backgroundColor = [UIColor colorWithPatternImage:[self createBackgroundImage:@"right.jpg"]];
//    self.right.view.contentMode = UIViewContentModeScaleAspectFit;
    
    [self addChildViewController:self.left];
    [self addChildViewController:self.right];
    [self addChildViewController:self.mid];
    [self.view addSubview:self.left.view];
    [self.view addSubview:self.right.view];
    [self.view addSubview:self.mid.view];
    
    
}
-(void)createButton{
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(40, 200, 80, 40);
    leftButton.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    [leftButton setTitle:@"左抽屉" forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(SC_WIDTH-120, 200, 80, 40);
    rightButton.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    [rightButton setTitle:@"右抽屉" forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.mid.view addSubview:leftButton];
    [self.mid.view addSubview:rightButton];
    
}
-(void)leftClick:(UIButton*)btn{


    if (self.mid.view.frame.origin.x == 0) {
        
        self.right.view.frame = CGRectMake(SC_WIDTH, 0,SC_WIDTH,SC_HEIGHT);
        
        [UIView animateWithDuration:0.5 animations:^{
            
            self.mid.view.frame = CGRectMake(200, 0,SC_WIDTH,SC_HEIGHT);
            self.mid.view.transform = CGAffineTransformMakeScale(0.8, 0.8);

        } completion:^(BOOL finished) {
            
        }];
        
    }else{
        
        [UIView animateWithDuration:0.5 animations:^{
            
            self.mid.view.transform = CGAffineTransformIdentity;
            self.mid.view.frame = CGRectMake(0, 0,SC_WIDTH,SC_HEIGHT);

        } completion:^(BOOL finished) {
            
            self.right.view.frame = CGRectMake(0, 0,SC_WIDTH,SC_HEIGHT);
            
        }];
        
    }
    
}
-(void)rightClick:(UIButton*)btn{
    
    if (self.mid.view.frame.origin.x == 0) {
        
        self.left.view.frame = CGRectMake(-SC_WIDTH, 0,SC_WIDTH,SC_HEIGHT);
        
        [UIView animateWithDuration:0.5 animations:^{
            
            self.mid.view.frame = CGRectMake(-200,0,SC_WIDTH,SC_HEIGHT);
            self.mid.view.transform = CGAffineTransformMakeScale(0.8, 0.8);

        } completion:^(BOOL finished) {
            
        }];
        
    }else{
        
        [UIView animateWithDuration:0.5 animations:^{
            
            self.mid.view.transform = CGAffineTransformIdentity;
            self.mid.view.frame = CGRectMake(0, 0,SC_WIDTH,SC_HEIGHT);

        } completion:^(BOOL finished) {
            
            self.left.view.frame = CGRectMake(0, 0,SC_WIDTH,SC_HEIGHT);
            
        }];
        
    }
    
    
}

//添加控制器背景图片
-(UIImage *)createBackgroundImage:(NSString*)img{
    
    UIImage *oldImage = [UIImage imageNamed:img];
    
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, NO, 0.0);
    [oldImage drawInRect:self.view.bounds];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
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
