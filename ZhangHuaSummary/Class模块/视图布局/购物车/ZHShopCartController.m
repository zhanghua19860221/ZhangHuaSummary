//
//  ZHShopCartController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/10/8.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHShopCartController.h"
#import "ZHShopingCartModel.h"
#import "ZHShopppingCartBottomView.h"
#import "ZHShopingCartHeaderView.h"
#import "ZHShopingCartCell.h"

@interface ZHShopCartController ()<UITableViewDelegate,UITableViewDataSource>{
    BOOL isEdit;
}
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray<ZH_StoreModel *> *storeArray;
@property (nonatomic, strong) ZHShopppingCartBottomView *bottomView;
/**
 选中的数组
 */
@property (nonatomic, strong) NSMutableArray *selectArray;
@end

@implementation ZHShopCartController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubViews];
    [self loadingDataForPlist];
    self.view.backgroundColor = COLORFromRGB(0xf5f5f5);
    isEdit = NO;
    [self createNav];
    // Do any additional setup after loading the view.
}
- (void)createNav{
    NSInteger x;
    NSInteger y;
    if (IOS11) {
        x = 8;
        y = 8;
    }else{
        x = 0;
        y = -10;
    }
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(x, y, 20, 20);
    rightBtn.adjustsImageWhenHighlighted = NO;
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:W(16)];
    [rightBtn addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    [rightBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [rightBtn setTitleColor:COLORFromRGB(0x333333) forState:UIControlStateNormal];


}
- (void)rightClick:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (btn.selected) {
        
        [self editBtn:btn editOpen:YES enabled:NO editBtnColor:COLORFromRGB(0xe10000)];

    }else{
        [self editBtn:btn editOpen:NO enabled:YES editBtnColor:COLORFromRGB(0x333333)];
    }
    
}
- (void)editBtn:(UIButton *)btn editOpen:(BOOL)isOpen enabled:(BOOL)isEnabled editBtnColor:(UIColor *)color{
    isEdit = isOpen;
    [btn setTitleColor:color forState:UIControlStateNormal];
    [self.myTableView setEditing:isOpen animated:YES];
    for (int i = 0; i<self.storeArray.count;i++ ) {
        
        for ( int j = 0;j<self.storeArray[i].goodsArray.count  ;j++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:j inSection:i];
            //获取到每个cell的clickBtn按钮 取消隐藏
            ZHShopingCartCell *cell = (ZHShopingCartCell *)[self.myTableView cellForRowAtIndexPath:indexPath];
            cell.clickBtn.hidden = isOpen;
            ZHShopingCartHeaderView *headerView = (ZHShopingCartHeaderView *)[self.myTableView headerViewForSection:i];
            headerView.clickBtn.enabled = isEnabled;
            self.bottomView.clickBtn.enabled = isEnabled;
        }
    }
    
}
- (NSMutableArray *)selectArray {
    if (!_selectArray) {
        self.selectArray = [NSMutableArray new];
    }
    return _selectArray;
}
- (NSMutableArray *)storeArray {
    if (!_storeArray) {
        self.storeArray = [NSMutableArray new];
    }
    return _storeArray;
}
#pragma  mark --------------------- UI ------------------
- (void)setSubViews {
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavAndStatusHeight, kScreenWidth, kScreenHeight - kTabBarHeight-kNavAndStatusHeight) style:UITableViewStyleGrouped];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    [self.view addSubview:_myTableView];
    _myTableView.separatorStyle  = UITableViewCellSeparatorStyleNone;

    self.myTableView.tableFooterView = [[UIView alloc] init];
    [_myTableView registerClass:[ZHShopingCartCell class] forCellReuseIdentifier:@"cell"];
    _myTableView.estimatedRowHeight = 0;
    _myTableView.estimatedSectionHeaderHeight = 0;
    _myTableView.estimatedSectionFooterHeight = 0;
    self.bottomView = [[ZHShopppingCartBottomView alloc] init];
    _bottomView.frame = CGRectMake(0, kScreenHeight - kTabBarHeight, kScreenWidth, kTabBarHeight);
    //全选
    [self clickAllSelectBottomView:_bottomView];
    
    [self.view addSubview:self.bottomView];
}

#pragma mark ------------------ <UITableViewDelegate, UITableViewDataSource> ----
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.storeArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ZH_StoreModel *storeModel = self.storeArray[section];
    return storeModel.goodsArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZHShopingCartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    ZH_StoreModel *storeModel = self.storeArray[indexPath.section];
    ZH_GoodsModel *goodsModel = storeModel.goodsArray[indexPath.row];
    cell.goodsModel = goodsModel;

    //把事件的处理分离出去
    [self shoppingCartCellClickAction:cell storeModel:storeModel goodsModel:goodsModel indexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return H(100);
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return H(100);

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return H(40);
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return  H(20);
    //return CGFLOAT_MIN;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ZHShopingCartHeaderView * headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    if (!headerView) {
        headerView = [[ZHShopingCartHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, H(40))];
        if (isEdit) {
            headerView.clickBtn.enabled = NO;
        }else{
            headerView.clickBtn.enabled = YES;
        }
        headerView.contentView.backgroundColor = COLORFromRGB(0xffffff);
    }
    ZH_StoreModel *storeModel = self.storeArray[section];
    headerView.storeModel = storeModel;
    //分区区头点击事件--- 把事件分离出去
    [self clickSectionHeaderView:headerView ZHStoreModel:storeModel];
    return headerView;
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"确定删除吗";
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定删除?" message:nil preferredStyle:(UIAlertControllerStyleAlert)];
        kWeakSelf(self);
        [alert addAction:[UIAlertAction actionWithTitle:@"是" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            kStrongSelf(self);
            [self deleteGoodsWithIndexPath:indexPath];

        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"否" style:(UIAlertActionStyleDefault) handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
}
/**
 删除某个商品
 @param indexPath 坐标
 */
- (void)deleteGoodsWithIndexPath:(NSIndexPath *)indexPath {
    ZH_StoreModel *storeModel = [self.storeArray objectAtIndex:indexPath.section];
    ZH_GoodsModel *goodsModel = [storeModel.goodsArray objectAtIndex:indexPath.row];
    [storeModel.goodsArray removeObjectAtIndex:indexPath.row];
    [self.myTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationFade)];
    if (storeModel.goodsArray.count == 0) {
        [self.storeArray removeObjectAtIndex:indexPath.section];
    }
    
    if ([self.selectArray containsObject:goodsModel]) {
        [self.selectArray removeObject:goodsModel];
        [self countPrice];
    }
    
    NSInteger count = 0;
    for (ZH_StoreModel *storeModel in self.storeArray) {
        count += storeModel.goodsArray.count;
    }
    if (self.selectArray.count == count) {
        _bottomView.clickBtn.selected = YES;
    } else {
        _bottomView.clickBtn.selected = NO;
    }
    
    if (count == 0) {
        //此处加载购物车为空的视图
        
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.myTableView reloadData];
    });
}


#pragma mark  ----------- Action 点击事件 --------------------
/**
 区头点击----选中某个分区/取消选中某个分区
 @param headerView 分区
 @param storeModel 分区模型
 */
- (void)clickSectionHeaderView:(ZHShopingCartHeaderView *)headerView ZHStoreModel:(ZH_StoreModel *)storeModel {
    headerView.ClickBlock = ^(BOOL isClick) {
        storeModel.isSelect = isClick;

        if (isClick) {//选中
            NSLog(@"选中");
            for (ZH_GoodsModel *goodsModel in storeModel.goodsArray) {
                goodsModel.isSelect = YES;
                if (![self.selectArray containsObject:goodsModel]) {
                    [self.selectArray addObject:goodsModel];
                }
            }

        } else {//取消选中
            NSLog(@"取消选中");
            for (ZH_GoodsModel *goodsModel in storeModel.goodsArray) {
                goodsModel.isSelect = NO;
                if ([self.selectArray containsObject:goodsModel]) {
                    [self.selectArray removeObject:goodsModel];
                }
            }
        }
        [self judgeIsAllSelect];
        [self.myTableView reloadData];
        [self countPrice];
    };
}
/**
 是否全选
 */
- (void)judgeIsAllSelect {
    NSInteger count = 0;
    //先遍历购物车商品, 得到购物车有多少商品
    for (ZH_StoreModel *storeModel in self.storeArray) {
        count += storeModel.goodsArray.count;
    }
    //如果购物车总商品数量 等于 选中的商品数量, 即表示全选了
    if (count == self.selectArray.count) {
        self.bottomView.isClick = YES;
    } else {
        self.bottomView.isClick = NO;
    }
}
/**
 计算价格
 */
- (void)countPrice {
    double totlePrice = 0.0;
    for (ZH_GoodsModel *goodsModel in self.selectArray) {
        double price = [goodsModel.realPrice doubleValue];
        totlePrice += price * [goodsModel.count integerValue];
    }
    self.bottomView.allPriceLabel.text = [NSString stringWithFormat:@"合计 ￥%.2f", totlePrice];
}

/**
 全选点击---逻辑处理
 @param bottomView 底部的View
 */
- (void)clickAllSelectBottomView:(ZHShopppingCartBottomView *)bottomView {
    kWeakSelf(self);
    bottomView.AllClickBlock = ^(BOOL isClick) {
        kStrongSelf(self);
        for (ZH_GoodsModel *goodsModel in self.selectArray) {
            goodsModel.isSelect = NO;
        }
        [self.selectArray removeAllObjects];
        if (isClick) {//选中
            NSLog(@"全选");
            for (ZH_StoreModel *storeModel in self.storeArray) {
                storeModel.isSelect = YES;
                for (ZH_GoodsModel *goodsModel in storeModel.goodsArray) {
                    goodsModel.isSelect = YES;
                    [self.selectArray addObject:goodsModel];
                }
            }
        } else {//取消选中
            NSLog(@"取消全选");
            for (ZH_StoreModel *storeModel in self.storeArray) {
                storeModel.isSelect = NO;
                
            }
        }
        [self.myTableView reloadData];
        [self countPrice];
    };
    
    bottomView.AccountBlock = ^{
        NSLog(@"去结算");
    };
}

- (void)shoppingCartCellClickAction:(ZHShopingCartCell *)cell
                         storeModel:(ZH_StoreModel *)storeModel
                         goodsModel:(ZH_GoodsModel *)goodsModel
                          indexPath:(NSIndexPath *)indexPath {
    //选中某一行
    cell.ClickRowBlock = ^(BOOL isClick) {
        goodsModel.isSelect = isClick;
        if (isClick) {//选中
            NSLog(@"选中");
            [self.selectArray addObject:goodsModel];
        } else {//取消选中
            NSLog(@"取消选中");
            [self.selectArray removeObject:goodsModel];
        }
        
        [self judgeIsSelectSection:indexPath.section];
        [self countPrice];
    };
    [self judgeIsAllSelect];
    //加
    cell.AddBlock = ^(UILabel *countLabel) {
        NSLog(@"%@", countLabel.text);
        goodsModel.count = countLabel.text;
        [storeModel.goodsArray replaceObjectAtIndex:indexPath.row withObject:goodsModel];
        if ([self.selectArray containsObject:goodsModel]) {
            [self.selectArray removeObject:goodsModel];
            [self.selectArray addObject:goodsModel];
            [self countPrice];
        }
        
    };
    //减
    cell.CutBlock = ^(UILabel *countLabel) {
        NSLog(@"%@", countLabel.text);
        goodsModel.count = countLabel.text;
        [storeModel.goodsArray replaceObjectAtIndex:indexPath.row withObject:goodsModel];
        if ([self.selectArray containsObject:goodsModel]) {
            [self.selectArray removeObject:goodsModel];
            [self.selectArray addObject:goodsModel];
            [self countPrice];
        }
    };
}
/**
 判断分区有没有被全选
 @param section 分区坐标
 */
- (void)judgeIsSelectSection:(NSInteger)section {
    ZH_StoreModel *storeModel = self.storeArray[section];
    BOOL isSelectSection = YES;
    //遍历分区商品, 如果有商品的没有被选择, 跳出循环, 说明没有全选
    for (ZH_GoodsModel *goodsModel in storeModel.goodsArray) {
        if (goodsModel.isSelect == NO) {
            isSelectSection = NO;
            break;
        }
    }
    //全选了以后, 改变一下选中状态
    ZHShopingCartHeaderView *headerView = (ZHShopingCartHeaderView *)[self.myTableView headerViewForSection:section];
    headerView.isClick = isSelectSection;
    storeModel.isSelect = isSelectSection;
}

#pragma mark  -------------------- 此处模仿网络请求, 加载plist文件内容
- (void)loadingDataForPlist {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ShopCarNew" ofType:@"plist"];
    NSDictionary *dataDic = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSLog(@"dataDic == %@", dataDic);
    NSArray *dataArray = dataDic[@"data"];
    if (dataArray.count > 0) {
        for (NSDictionary *dic in dataArray) {
            ZH_StoreModel *model = [[ZH_StoreModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.storeArray addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.myTableView reloadData];
        });
        
    } else {
        //加载数据为空时的展示
        
    }
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
