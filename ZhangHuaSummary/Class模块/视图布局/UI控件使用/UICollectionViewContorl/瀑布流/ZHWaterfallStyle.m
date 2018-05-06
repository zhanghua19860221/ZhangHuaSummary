//
//  ZHWaterfallStyle.m
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/8/24.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import "ZHWaterfallStyle.h"
#import "ZHCustomLayOut.h"
#import "ZHWaterfallCell.h"
@interface ZHWaterfallStyle ()

@end

@implementation ZHWaterfallStyle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatLayout];
    [self creatCollectionView];
    self.view.backgroundColor = [UIColor whiteColor];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 <#Description#> - 初始化layout
 */
-(void)creatLayout{
    
    self.layout = [[ZHCustomLayOut alloc] init];
    //设置collectionView的滚动方向
    self.layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //去除item之间的间隔
    self.layout.itemCount = 9;
    self.layout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);
    self.layout.minimumLineSpacing = 5;
    self.layout.minimumInteritemSpacing = 5;
    
}

/**
 <#Description#> - 创建collectionView
 */
-(void)creatCollectionView{

    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:self.layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    //分页功能
    self.collectionView.pagingEnabled = YES;

    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ID"];
    [self.view addSubview:self.collectionView];
    
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 9;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ID" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    
//    [cell addDataSourceToCell:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    return cell;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    

}

////设置每个item的尺寸
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row%2==0) {
//        return CGSizeMake(70, 70);
//    }else{
//        return CGSizeMake(100, 100);
//    }
//}
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    NSLog(@"%ld++++",section);
//    return UIEdgeInsetsMake(20, 20, 20, 20);
//}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
