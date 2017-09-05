//
//  ZHQinHaiLake.m
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/9/5.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import "ZHQinHaiLake.h"
#import "QinHaiLakeTransportLine.h"
@interface ZHQinHaiLake ()

@end

@implementation ZHQinHaiLake

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSourceData];
    [self creatTableView];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
-(void)initSourceData{
    self.tableArray  = [[NSMutableArray alloc]initWithObjects:@"西宁->塔尔寺",@"塔卡寺->倒淌河",nil];
    self.detailArray  = [[NSMutableArray alloc]initWithObjects:
    @"西宁至塔尔寺的公交专线,火车站(5路,9路公交车停车场),沿途经过建国路,省人民医院,共和路,昆仑桥,南川东路,总寨,徐家寨,终点至湟中汽车站,时程约1小时.每日首班车7时30分发车,末班车19时30分发车.另外,西宁至塔尔寺公交专线单程约32公里,全程投币3元,成人刷卡2.40元,学生刷卡0.5元,老年卡每次刷卡冲减两次免费乘坐.西宁至塔尔寺高速快客由10辆中型高一级燃气客运车在西塔高速一级公路上营运.始发站点为新宁路客运站和湟中汽车站,每日7时至18时30分双向对发,时程约半小时,票价初定为5.30元.公交官方电话:4001009840", nil];
}
-(void)creatTableView{
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];

}
-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma ***************UITableViewDelegate*****************************
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.tableArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"tableViewCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld - %@",(long)indexPath.row,self.tableArray[indexPath.row]];
    cell.textLabel.font = [UIFont systemFontOfSize:18];
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    //添加cell上最后侧箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QinHaiLakeTransportLine *vc = [[QinHaiLakeTransportLine alloc]init];
    vc.lineStr = self.detailArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
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
