//
//  NetURLDemo.m
//  iOSanimation
//
//  Created by biyabi on 15/9/29.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "NetURLDemo.h"
#import <Masonry.h>

@interface NetURLDemo ()<NSURLConnectionDataDelegate,NSURLSessionDownloadDelegate,NSURLSessionDataDelegate>
@property (nonatomic, strong) UIButton *urlConnectButton;
@property (nonatomic, strong) UIButton *urlSectionButton;

//用来写数据的文件句柄对象
@property (nonatomic, strong) NSFileHandle *writehandle;

//是否开始
@property (nonatomic, assign) BOOL isStart;

/**
 *  文件的总大小
 */
@property (nonatomic, assign) long long totalLength;
/**
 *  当前已经写入的文件大小
 */
@property (nonatomic, assign) long long currentLength;

/**
 *  1-->连接对象
 */
@property (nonatomic, strong) NSURLConnection *conn;

/**
 *  2-->连接对象
 */
@property (nonatomic, strong) NSURLSessionDownloadTask *task;

@property (nonatomic, strong) NSData *resumeData;
@property (nonatomic, strong) NSURLSession *session;

@end

@implementation NetURLDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self initConnectBtnFrame];
    [self initSectionBtnFrame];
}

- (void)initConnectBtnFrame{
    [self.urlConnectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.urlSectionButton);
        make.height.equalTo(@49);
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.right.equalTo(self.urlSectionButton.mas_left).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

- (void)initSectionBtnFrame{
    [self.urlSectionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.urlConnectButton);
        make.height.equalTo(@49);
        make.right.equalTo(self.view.mas_right).with.offset(-10);
        make.left.equalTo(self.urlConnectButton.mas_right).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
}


- (UIButton *)urlConnectButton{
    if (!_urlConnectButton) {
        _urlConnectButton = [[UIButton alloc]init];
        [_urlConnectButton setBackgroundColor:[UIColor lightGrayColor]];
        [_urlConnectButton setTitle:@"NSURLConnection" forState:UIControlStateNormal];
        _urlConnectButton.tag = 1;
        [_urlConnectButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_urlConnectButton];
    }
    return _urlConnectButton;
}

- (UIButton *)urlSectionButton{
    if (!_urlSectionButton) {
        _urlSectionButton = [[UIButton alloc]init];
        [_urlSectionButton setBackgroundColor:[UIColor darkGrayColor]];
        [_urlSectionButton setTitle:@"NSURLSection" forState:UIControlStateNormal];
        _urlSectionButton.tag = 2;
        [_urlSectionButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_urlSectionButton];
    }
    return _urlSectionButton;
}

- (void)buttonClick:(UIButton *)button{
    if (button.tag == 1) {
        NSLog(@"1");
        
        //1.1、使用Connect基础版本  不使用代理 一般是小文件
        //[self simpleUrlConnectRequest];
        
        //1.2、使用代理，一般是大文件下载 (支持断点)
        [self complicatedUrlConnectRequest];
        
    }else if(button.tag == 2){
        NSLog(@"2");
        
        //2.1.使用URLSession 直接下载
//        [self simpleNSURLSession];
        //2.2、谁用代理
        [self complicatedUrlSessionRequest];
    }
}

#pragma mark ----- NSURLSession DataDelegate-----

- (void)complicatedUrlSessionRequest{
    if (!self.session) {
        NSURLSessionConfiguration *cfg = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:cfg delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    }
    
    //取反状态
    self.isStart = !self.isStart;
    if (self.isStart) {
        if (self.resumeData) { //已经有数据了，回复数据
            [self resume];
        } else { // 开始
            [self start];
        }
    }else{// 暂停
        [self pause];
    }
}

//暂停
- (void)pause
{
    __weak typeof(self) vc = self;
    [self.task cancelByProducingResumeData:^(NSData *resumeData) {
        //  resumeData : 包含了继续下载的开始位置\下载的url
        vc.resumeData = resumeData;
        vc.task = nil;
    }];
}

//开始
- (void)start
{
    // 1.创建一个下载任务
    NSURL *url = [NSURL URLWithString:@"http://downlaod.vstart.net/i/?cid=699"];
    self.task = [self.session downloadTaskWithURL:url];
    
    // 2.开始任务
    [self.task resume];
}

//回复
- (void)resume{
    // 传入上次暂停下载返回的数据，就可以恢复下载
    self.task = [self.session downloadTaskWithResumeData:self.resumeData];
    
    // 开始任务
    [self.task resume];
    
    // 清空
    self.resumeData = nil;
}

//下载完成之后调用
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    // response.suggestedFilename ： 建议使用的文件名，一般跟服务器端的文件名一致
    NSString *file = [caches stringByAppendingPathComponent:downloadTask.response.suggestedFilename];
    
    // 将临时文件剪切或者复制Caches文件夹
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    // AtPath : 剪切前的文件路径
    // ToPath : 剪切后的文件路径
    [mgr moveItemAtPath:location.path toPath:file error:nil];
    
    //清空配置
    self.resumeData = nil;
    self.task = nil;
    self.isStart = NO;
}

//每次下载完成一部分，就调用一次，可以用来监控进度
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    NSLog(@"totalBytesExpectedToWrite:%lf",(double)totalBytesWritten/totalBytesExpectedToWrite);
    
}


-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes{
}

- (void)simpleNSURLSession{
    
    //普通字典活着数组下载
    NSURL *url2 = [NSURL URLWithString:@"http://www.baidu.com"];//普通的拿数据文件
    NSMutableURLRequest *request2 =[NSMutableURLRequest requestWithURL:url2];
    
    NSURLSession *session2 = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session2 dataTaskWithRequest:request2 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSString *dict = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"----%@", dict);
    }];
    [task resume];
    
    //有点数据量的那种 下载
    NSURL *url = [NSURL URLWithString:@"http://downlaod.vstart.net/i/?cid=699"];
//    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDownloadTask *ts = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        
        NSString *file = [caches stringByAppendingPathComponent:response.suggestedFilename];
        
        // 将临时文件剪切或者复制Caches文件夹
        NSFileManager *mgr = [NSFileManager defaultManager];
        [mgr moveItemAtPath:location.path toPath:file error:nil];
        NSLog(@"success:%@",location);
    }];
    [ts resume];
}

#pragma mark ----- NSURLConnection DataDelegate -----

- (void)complicatedUrlConnectRequest{
    self.isStart = !self.isStart;
    if (self.isStart) {
        NSURL *url = [NSURL URLWithString:@"http://downlaod.vstart.net/i/?cid=699"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        
        NSString *range = [NSString stringWithFormat:@"byte=%lld-",self.currentLength];
        [request setValue:range forHTTPHeaderField:@"Range"];
        
        self.conn = [NSURLConnection connectionWithRequest:request delegate:self];
        
    }else{
        [self.conn cancel];
        self.conn = nil;
    
    }
}

//失败
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"didFailWithError");
}

//完成
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    self.currentLength = 0;
    self.totalLength = 0;
    self.isStart = NO;
    // 关闭文件
    [self.writehandle closeFile];
    self.writehandle = nil;

}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSString *cache = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *filename = response.suggestedFilename;
    //沙盒
    NSString *filepath = [cache stringByAppendingString:filename];
    
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    //创建文件路径
    [mgr createFileAtPath:filepath contents:nil attributes:nil];
    
    self.totalLength = response.expectedContentLength;

}

//返回实体数据，这个方法会被多次调用
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    //末尾
    [self.writehandle seekToEndOfFile];
    
    //写入
    [self.writehandle writeData:data];
    
    //累计长度
    self.currentLength += data.length;
    
    NSLog(@"self.currentLength:%lld",self.currentLength);
    NSLog(@"(double)self.currentLength/ self.totalLength:%f",(double)self.currentLength/ self.totalLength);
}

- (void)simpleUrlConnectRequest{
//    NSURL *url = [NSURL URLWithString:@"http://www.nikon-asia.com/tmp/Asia/2419865273/3760176746/2586568015/286546384/700963278/173574799/3015334490/365508689/1054978028/2432569721/2761598298/2422721710.jpg"];
    NSURL *url = [NSURL URLWithString:@"http://6.tjwt1.crsky.com/201412/7z-v9.35.zip"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSLog(@"sampleUrlConnectRequest:%d",(int)data.length);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
