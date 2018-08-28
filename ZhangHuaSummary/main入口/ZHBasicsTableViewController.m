//
//  ZHBasicsTableViewController.m
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/8/23.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import "ZHBasicsTableViewController.h"

@interface ZHBasicsTableViewController ()

@end

@implementation ZHBasicsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];

}

- (void)didReceiveMemoryWarning {
                  [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.tableListArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"tableViewCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld - %@",(long)indexPath.row,self.tableListArray[indexPath.row]];
    cell.textLabel.font = [UIFont systemFontOfSize:18];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //添加cell上最后侧箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *tempName = self.controllerTitle[indexPath.row];
    
    if (tempName!=nil) {
        
        UIViewController *VC =[[NSClassFromString(tempName) alloc] init];
        VC.title = self.tableListArray[indexPath.row];
        VC.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:VC animated:YES];
        
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}


@end
