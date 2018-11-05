//
//  OptimizationSummaryController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/8/28.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "OptimizationSummaryController.h"
#import "OptimizationDetailController.h"

@interface OptimizationSummaryController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong , nonatomic)UITableView *tableView;
@property (strong , nonatomic)NSArray *dataArray;


@end

@implementation OptimizationSummaryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLORFromRGB(0xffffff);
    [self initDataSource];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    // Do any additional setup after loading the view.
}
- (void)initDataSource{
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Optimization" ofType:@"plist"];
    NSDictionary *tempDic = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    self.dataArray = tempDic[@"ProblemArray"];
    
}
/**
 懒加载tableview
 
 */
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        _tableView.backgroundColor = COLORFromRGB(0xf9f9f9);
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view);
            make.left.right.equalTo(self.view);
            if (kScreenHeight == 812) {
                make.height.mas_equalTo(kScreenHeight);
                
            }else{
                make.height.mas_equalTo(kScreenHeight);
                
            }
            
        }];
    }
    return _tableView;
}
#pragma ************UItableViewDelegate********************

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *ID = [NSString stringWithFormat:@"Cell%ld",(long)indexPath.row];
    //以indexPath来唯一确定cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    //添加cell上最后侧箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.dataArray[indexPath.row][@"title"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    OptimizationDetailController *pc = [[OptimizationDetailController alloc] init];
    pc.dataDic = _dataArray[indexPath.row];
    [self.navigationController pushViewController:pc animated:YES];
    
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
