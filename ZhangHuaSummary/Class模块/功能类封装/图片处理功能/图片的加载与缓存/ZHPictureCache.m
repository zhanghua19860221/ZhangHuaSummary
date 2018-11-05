//
//  ZHPictureCache.m
//  ZhangHuaSummary
//
//  Created by zhanghua0221 on 17/9/1.
//  Copyright © 2017年 zhanghua0221. All rights reserved.
//

#import "ZHPictureCache.h"

@interface ZHPictureCache ()

@end

@implementation ZHPictureCache

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDataSource];
    [self createTableView];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
-(void)initDataSource{
    self.objectCache = [[ZHWebImageCache alloc] initWithCache];
    self.objectCache.delegate = self ;
    self.imageArray = [[NSArray alloc] initWithObjects:
                       @"http://im6.tongbu.com/wallpaper/user/201504/03/07a2f292-7.jpg.417_741.jpg",
                       @"http://pic.ffpic.com/files/2014/0416/0415gqcjtxsjbz4.jpg",
                       @"http://pic.ffpic.com/files/2014/0416/0415gqcjtxsjbz4.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1504863285&di=ed493b469d295161184cd24cbf088ece&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.sc115.com%2Fsh%2Fpic1%2F1501xjfspuuljnb.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1504268571032&di=055330024bbfb38b81462477486d7492&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201405%2F29%2F20140529182201_yKemd.jpeg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1504268571028&di=db7ab06c7928423bfff90a09e623c65d&imgtype=0&src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201501%2F15%2F20150115124529_aAGst.jpeg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1504268571027&di=8dd1759c08e7c6df1ee7876a3eb7c8fc&imgtype=0&src=http%3A%2F%2Fimg.bbs.duba.net%2Fforum%2F201111%2F28%2F163115hoypd7e2q2gyg7g2.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1504268571026&di=2193322196e5aedb7cfc5c02bddce171&imgtype=0&src=http%3A%2F%2Fd.5857.com%2Fkakt_170307%2Fdesk_005.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1504268571025&di=aa5239348cdd841ac23a8c47671a6293&imgtype=0&src=http%3A%2F%2Fimg4.duitang.com%2Fuploads%2Fitem%2F201409%2F20%2F20140920002200_xLUyC.jpeg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1504268571025&di=bd35d1f9a1d569107bff7339bf6d3fdf&imgtype=0&src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fitem%2F201505%2F01%2F20150501105820_emscC.thumb.224_0.jpeg",
                       nil];
}
-(void)createTableView{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.imageArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    NSString *imageDataPath = [[self.objectCache getLocationImageDataFilePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    NSData *imageData = [self.objectCache getLocalCacheImage:imageDataPath];
    
    if (imageData) {
        UIImage *image = [UIImage imageWithData:imageData];
        [cell.imageView setImage:image];
    }else{
        
        [self.objectCache  cacheWebImageUrl:self.imageArray[indexPath.row] imageName:[NSString stringWithFormat:@"%ld",indexPath.row]];
    }
    [cell.textLabel setText:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 44;
};
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 9) {
        [self .objectCache removeImageCacheFile];
        NSString *delegateSize = [NSString stringWithFormat:@"清空缓存、缓存文件夹大小为%.2fMB",[self.objectCache getFileSizeAtPath]/1024.0/1024.0,nil];
        UIAlertView *delegateView = [[UIAlertView alloc] initWithTitle:@"标题" message:delegateSize delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"好的", nil];
        [delegateView show];
    }else{
        NSString *fileSize = [NSString stringWithFormat:@"缓存文件夹大小为%.2fMB",[self.objectCache getFileSizeAtPath]/1024.0/1024.0,nil];
        
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"标题" message:fileSize delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"好的", nil];
        [alertview show];
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)refreshUIOperation{
    [self.tableView reloadData];
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
