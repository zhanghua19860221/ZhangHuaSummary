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
    _isClick = NO ;
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
-(void)initSourceData{
    self.tableArray  = [[NSMutableArray alloc]initWithObjects:@"西宁->塔尔寺",@"西宁->倒淌河",@"西宁->二郎剑",@"西宁->黑马河乡",@"西宁->茶卡盐湖",@"西宁->金银滩",@"西宁->金沙滩",nil];
    self.detailArray  = [[NSMutableArray alloc]initWithObjects:
                         @"西宁-->塔尔寺-->公交专线,火车站(5路--9路公交车停车场),经过建国路->省人民医院->共和路->昆仑桥->南川东路->总寨->徐家寨->终点至湟中汽车站,时程约1小时.每日((首班车7时30分发车)),((末班车19时30分发车)).另外,西宁-->塔尔寺公交专线单程约32公里,全程((投币3元)),成人刷卡2.40元,学生刷卡0.5元.西宁-->塔尔寺高速快客由10辆中型高一级燃气客运车在西塔高速一级公路上营运.始发站点为新宁路客运站和湟中汽车站,每日((7时至18时30分))双向对发,时程约半小时,票价初定为5.30元.公交官方电话-->>4001009840",@"西宁汽车站客运中心->倒淌河,大巴比较多。",@"1.西宁市八一路客运站每天7:30、8:00、8:15、8:30、8:45、9:00、9:15、9:30、16:00共有九班班车（淡季时会减少，需提前致电八一路汽车站0971-8803471咨询）前往二郎剑景区，车程约2.5小时，票价40元左右。　　2. 可以乘坐西宁市发往哈图、乌兰的汽车，到青海湖景区处下车（提前和售票员沟通好），票价40-70左右不等。",@"西宁(客运站中心)->黑马河 ：发车时间一天三班 分别是 8:30 ,09:45 ,12:00",@"西宁(客运中心)->茶卡盐湖。发车一天六班 分别是 08:00 ,09:45 ,11:00 ,12:00 ,14:00 ,15:30",@"西宁((长途客运站))->海晏县约2小时，票价15元/人，每小时都有班车，交通十分方便。出租车：青海省海晏县起步价6元。",@"居然没有找到路线。。。。",nil];
}
-(void)creatTableView{
    //为头视图添加点击手势
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap)];
    
    _headView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    [_headView setImage:[UIImage imageNamed:@"5.png"]];
    [_headView addGestureRecognizer:singleTap];
    _headView.userInteractionEnabled = YES;
    
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.tableHeaderView = _headView ;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];

}
-(void)handleSingleTap{
    if (_isClick) {
        _headView.frame = CGRectMake(0, 0, kScreenWidth, 200);
        _isClick = NO;
    }else{
        _headView.frame = CGRectMake(0, 0, kScreenWidth, 300);
        _isClick = YES;
    }
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
    return cell;
}
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
