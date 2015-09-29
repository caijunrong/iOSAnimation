//
//  NetURLDemo.m
//  iOSanimation
//
//  Created by biyabi on 15/9/29.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "NetURLDemo.h"
#import <Masonry.h>

@interface NetURLDemo ()
@property (nonatomic, strong) UIButton *urlConnectButton;
@property (nonatomic, strong) UIButton *urlSectionButton;
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
        
        //使用Conn
//        [self sampleUrlConnectRequest];
    }else if(button.tag == 2){
        NSLog(@"2");
        
        //使用Section
    }
}



-(void)sampleUrlConnectRequest{
    NSURL *url = [NSURL URLWithString:@"http://www.nikon-asia.com/tmp/Asia/2419865273/3760176746/2586568015/286546384/700963278/173574799/3015334490/365508689/1054978028/2432569721/2761598298/2422721710.jpg"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        NSLog(@"sampleUrlConnectRequest:%d",data.length);
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
