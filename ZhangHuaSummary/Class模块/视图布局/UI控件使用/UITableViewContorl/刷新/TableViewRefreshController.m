//
//  TableViewRefreshController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/5/4.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "TableViewRefreshController.h"
//MJRefresh 刷新
#import <MJRefresh.h>
#import <AFHTTPSessionManager.h>
#import "ZHNetWorking.h"
#import "UIScrollView+EmptyDataSet.h"

@interface TableViewRefreshController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>{
    
    MJRefreshAutoNormalFooter *footer;
    NSInteger pageNum;
}

@property (strong , nonatomic)UITableView *tableView;
@property (strong , nonatomic) NSMutableArray * dataArray;

@end

@implementation TableViewRefreshController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];

    // Do any additional setup after loading the view.
}
/**
 懒加载数组
 */
- (NSMutableArray *)dataArray{
    if (nil == _dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:2];
    }
    return _dataArray;
}

/**
 tableView懒加载
 */
-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.emptyDataSetSource = self;
        _tableView.emptyDataSetDelegate = self;
        
        [self.view addSubview:_tableView];
        //是否显示底部分割线
         _tableView.separatorStyle = YES;
        
        //去除上啦加载数据屏幕弹动问题 因为iOS11之前 默认的cell高度是 0,之后是 44
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight =0;
        _tableView.estimatedSectionFooterHeight =0;
        
        
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(prepareData)];
          //是否隐藏刷新的时间
//        header.lastUpdatedTimeLabel.hidden = YES;
        footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        _tableView.mj_header = header;
        _tableView.mj_footer = footer;
        
        _tableView.tableFooterView = [UIView new];
        //可以隐藏默认的底部刷新文字 -(footer.stateLabel.hidden = NO/yes)
        //footer.stateLabel.hidden = NO;

    }
    return _tableView;
}
/*
 下啦刷新数据
 */

- (void)prepareData{
    [[ZHNetWorking shareInstance] postOrGetWithType:POST URL:nil parameter:nil showHUD:YES success:^(id response) {
        
        //字典里面
        pageNum = 2;
        //首先重新初始化数组
        self.dataArray = nil;
        
        [_tableView.mj_header endRefreshing];
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}
- (void)loadMoreData {
    footer.stateLabel.hidden = NO;
    [_tableView.mj_footer endRefreshing];
    //如果没有更多数据的时候可以进行设置
    [footer setTitle:@"我也是有底线的." forState:MJRefreshStateIdle];
    pageNum = pageNum++;

//    [[ZHNetWorking shareInstance] postOrGetWithType:POST URL:nil parameter:nil showHUD:YES success:^(id response) {
//        [_tableView.mj_footer endRefreshing];
//        [self.tableView reloadData];
//
//    } failure:^(NSError *error) {
//
//    }];
    
}
#pragma *****************DZNEmptyDataSetDelegate*****************************

- (UIImage *)buttonImageForEmptyDataSet :( UIScrollView *)scrollView forState:(UIControlState)state
{
    return [UIImage imageNamed:@"emptyhd.png"];
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma ************UItableViewDelegate********************

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *ID = [NSString stringWithFormat:@"Cell%ld",(long)indexPath.row];
    //以indexPath来唯一确定cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    NSString *line = [NSString stringWithFormat:@"现在是测试数据第%ld行",indexPath.row];
    cell.textLabel.text = line ;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return H(50);
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
