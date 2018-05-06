//
//  ZHRoundDisplay.m
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/8/29.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import "ZHRoundDisplay.h"

@interface ZHRoundDisplay ()

@end

@implementation ZHRoundDisplay

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatLayout];
    [self creatColleactionView];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
-(void)creatLayout{
    self.layout = [[ZHRoundLayout alloc]init];
}
-(void)creatColleactionView{
    self.collectionView  = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:self.layout];
    self.collectionView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    [self.view addSubview:self.collectionView];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.layer.cornerRadius = 50;
    cell.layer.masksToBounds = YES;

    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    return cell;
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
