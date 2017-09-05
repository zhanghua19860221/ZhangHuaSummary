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
    
    self.imageArray = [[NSArray alloc] initWithObjects:
                       @"http://im6.tongbu.com/wallpaper/user/201504/03/07a2f292-7.jpg.417_741.jpg",
                       @"http://img0.imgtn.bdimg.com/it/u=2369000635,199346171&fm=26&gp=0.jpg",
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
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SC_WIDTH, SC_HEIGHT) style:UITableViewStylePlain];
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
    NSData *imageData = [self getImageData:self.imageArray[indexPath.row]];
    [self saveImageData:imageData imagePathName:[NSString stringWithFormat:@"%ld",indexPath.row]];
    
//    NSString *imageDataFile = [[self setLocationImageDataFilePath:@"imageDataFile"] stringByAppendingPathComponent:[NSString stringWithFormat:@"%ld",indexPath.row]];
//    UIImage *image = [self getLocationCacheImage:imageDataFile];
    
    dispatch_queue_t queue= dispatch_queue_create("test.queue", DISPATCH_QUEUE_CONCURRENT);

    dispatch_async(queue, ^{
        
//        NSData *data = [self getImageData:self.imageArray[indexPath.row]];
//        UIImage *image = [UIImage imageWithData:data];
        NSLog(@"%@-----",[NSThread currentThread]);
//        dispatch_async(dispatch_get_main_queue(), ^{
//                [cell.imageView setImage:image];
//        });
    });
//    [cell.imageView setImage:[UIImage imageNamed:@"heheda.png"]];
    
    [cell.textLabel setText:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 44;
};
/**
 在沙盒中创建缓存文件夹

 @param imageFileName 保存图片的文件夹名称
 @return 本地缓存文件路径
 */
-(NSString*)setLocationImageDataFilePath:(NSString*)imageFileName{
    // 获得沙盒cache文件夹路径
    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    // 创建文件管理对象
    NSFileManager *imgFile = [NSFileManager defaultManager];
    
    // 在cache文件夹下面创建一个新的文件夹并取名为imageDataFile
    cachesPath = [cachesPath stringByAppendingPathComponent:imageFileName];

    // 判断此路径下是否存在此同名文件 没有就创建
    if(![imgFile fileExistsAtPath:cachesPath]){
        
        [imgFile createDirectoryAtPath:cachesPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return cachesPath;
}

/**
 讲网络图片转化为Data数据

 @param imageUrl 图片的网络地址
 @return 图片二进制数据
 */
-(NSData*)getImageData:(NSString*)imageUrl{
    
    NSURL *url = [NSURL URLWithString:imageUrl];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    
    return imageData;
}
/**
 把图片Data数据保存到文件夹目录下
 
 @param imageData 图片数据
 @param imagePath 文件夹下创建的 imageData文件名称
 */
-(void)saveImageData:(NSData*)imageData imagePathName:(NSString*)imagePath{
    
    
    NSString *imageDataPath= [[self setLocationImageDataFilePath:@"imageDataFile"] stringByAppendingPathComponent:imagePath];
    [imageData writeToFile:imageDataPath atomically:YES];
}

/**
 读取本地缓存图片

 @param imageDataPath 本地图片文件路径
 @return 返回路径对应的本地图片
 */
-(UIImage*)getLocationCacheImage:(NSString*)imageDataPath{
    
    NSData *imageData = [NSData dataWithContentsOfFile:imageDataPath];
    UIImage *image = [UIImage imageWithData:imageData];
    
    return image;
};

/**
 清除缓存文件

 @param cacheFilePath 文件路径
 */
-(void)removeImageCacheFile:(NSString*)cacheFilePath{

    NSFileManager *managar = [NSFileManager defaultManager];
    [managar removeItemAtPath:cacheFilePath error:nil];
    
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
