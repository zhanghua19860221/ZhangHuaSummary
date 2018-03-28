//
//  ZHFMDBController.m
//  ZhangHuaSummary
//
//  Created by 张华 on 2018/3/28.
//  Copyright © 2018年 zhanghua0221. All rights reserved.
//

#import "ZHFMDBController.h"
#import "ZHFMDBDataModel.h"
//数据库
#import <FMDatabase.h>
#import <FMDB.h>

@interface ZHFMDBController ()
{
    FMDatabase * collectBase ;//创建数据库
    NSMutableArray *mutbaleArray;
    
}

@end

@implementation ZHFMDBController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLORFromRGB(0xffffff);
    [self createSubView];
    [self createDatabase];
    // Do any additional setup after loading the view.
}
- (void)createSubView{
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.backgroundColor = [COLORFromRGB(0xe10000) colorWithAlphaComponent:0.5];
    [addButton setTitle:@"添加数据" forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addDataToBase) forControlEvents:UIControlEventTouchUpInside];
    addButton.layer.masksToBounds = YES;
    addButton.layer.cornerRadius  = 3;
    addButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:addButton];
    [addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY).offset(-130);
        make.height.mas_equalTo(40/SCALE_Y);
        make.width.mas_equalTo(140/SCALE_X);

        
    }];
    
    UIButton *deleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    deleButton.backgroundColor = [COLORFromRGB(0xe10000) colorWithAlphaComponent:0.5];
    [deleButton setTitle:@"删除数据" forState:UIControlStateNormal];
    [deleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [deleButton addTarget:self action:@selector(deleteDataFromBase) forControlEvents:UIControlEventTouchUpInside];
    deleButton.layer.masksToBounds = YES;
    deleButton.layer.cornerRadius  = 3;
    deleButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:deleButton];
    [deleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(addButton.mas_centerY).offset(60);
        make.height.mas_equalTo(40/SCALE_Y);
        make.width.mas_equalTo(140/SCALE_X);
        
        
    }];
    
    UIButton *changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    changeButton.backgroundColor = [COLORFromRGB(0xe10000) colorWithAlphaComponent:0.5];
    [changeButton setTitle:@"修改数据" forState:UIControlStateNormal];
    [changeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [changeButton addTarget:self action:@selector(changeDataFromBase) forControlEvents:UIControlEventTouchUpInside];
    changeButton.layer.masksToBounds = YES;
    changeButton.layer.cornerRadius  = 3;
    changeButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:changeButton];
    [changeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(deleButton.mas_centerY).offset(60);
        make.height.mas_equalTo(40/SCALE_Y);
        make.width.mas_equalTo(140/SCALE_X);
        
    }];
    
    
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    searchButton.backgroundColor = [COLORFromRGB(0xe10000) colorWithAlphaComponent:0.5];
    [searchButton setTitle:@"查询数据" forState:UIControlStateNormal];
    [searchButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(searchDataFromBase) forControlEvents:UIControlEventTouchUpInside];
    searchButton.layer.masksToBounds = YES;
    searchButton.layer.cornerRadius  = 3;
    searchButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:searchButton];
    [searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(changeButton.mas_centerY).offset(60);
        make.height.mas_equalTo(40/SCALE_Y);
        make.width.mas_equalTo(140/SCALE_X);
        
    }];
    
}
/**
 创建数据库表单
 */
- (void)createDatabase{
    
    mutbaleArray = [NSMutableArray arrayWithCapacity:2];
    //创建一文件
    collectBase=[[FMDatabase alloc] initWithPath:[NSString stringWithFormat:@"%@/Documents/collect.db",NSHomeDirectory()]];
    if ([collectBase open]) {
        //需要创建表格  创建表格的语句    create table 表名(字段名,字段名…);
        BOOL isSucceed=[collectBase executeUpdate:@"create table collectBase (type,content,remark,time)"];
        if(isSucceed){
            
            NSLog(@"数据库创建成功");
            
        }else{
            NSLog(@"数据库创建失败");
        }
    }else
    {
        NSLog(@"沙盒打开失败");
    }
    //需要查看数据库的东西时 ，可以打开查看沙盒路径
    NSLog(@"%@",NSHomeDirectory());
    
}
/**
 把数据添加到数据库中
 */
-(void)addDataToBase{
    //添加的语句    nsert into 表名 values(值,值);  ？类似我们的%@，添加参数时候使用的

    BOOL isSucceed=[collectBase executeUpdate:@"insert into CollectBase values(?,?,?,?)",@"auth_succese",@"没有失败",@"还是没有失败",@"2018-01-29"];
    
    if (isSucceed) {
        NSLog(@"添加成功");
    }else{
        NSLog(@"添加失败");

    }
}
//从数据库删除数据
-(void)deleteDataFromBase
{
    //删除的语句    delete from 表名 where 条件
    BOOL isSucceed =[collectBase executeUpdate: @"delete from CollectBase where remark = ?",@"还是没有失败"];
    
    if (isSucceed) {
        
        NSLog(@"删除成功");
    }else{
        
        NSLog(@"删除失败");
    }
}
//修改数据库中的一类数据
- (void)changeDataFromBase{
    
    //修改把remark字段对应 的type类型修改为@"auth_fail"
    BOOL isSucceed = [collectBase executeUpdate:@"UPDATE CollectBase SET type = ? WHERE remark = ?",@"auth_fail",@"还是没有失败"];
    
    if (isSucceed) {
        NSLog(@"修改成功");
        
    }else{
        NSLog(@"修改失败");
        
    }


}
//检索 数据库中的数据
-(void)searchDataFromBase{
    [mutbaleArray removeAllObjects];
    //    [shareDelegate sharedManager].collectArray = [NSMutableArray array];
    //增删改都使用的是同一个方法executeUpdate 查我们需要另外一个方法
    FMResultSet*result = [collectBase executeQuery:@"select * from collectBase"];
    //FMResultSet类似链表，他的头节点是nil，需要从第二位开始读取
    
    while ([result next]) {
        ZHFMDBDataModel *model = [[ZHFMDBDataModel alloc] init];
        model.type = [result stringForColumn:@"type"];
        model.content = [result stringForColumn:@"content"];
        model.remark = [result stringForColumn:@"remark"];
        model.time = [result stringForColumn:@"time"];
        [mutbaleArray addObject:model];
    }
    NSLog(@"mutbaleArray.count == %ld",mutbaleArray.count);
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
