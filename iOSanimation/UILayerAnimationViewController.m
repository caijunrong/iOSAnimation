//
//  UILayerAnimationViewController.m
//  iOSanimation
//
//  Created by caijunrong on 15/8/12.
//  Copyright (c) 2015年 caijunrong. All rights reserved.
//

#import "UILayerAnimationViewController.h"

@interface UILayerAnimationViewController ()
@property (nonatomic, assign) float width;
@property (nonatomic, assign) float height;
@property (nonatomic, strong) UIImage *smallImage;
@property (nonatomic, strong) UIView *layerView;
@end

@implementation UILayerAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    // Do any additional setup after loading the view.
    self.width = [UIScreen mainScreen].bounds.size.width;
    self.height = [UIScreen mainScreen].bounds.size.height;
    
    [self initImageOne];
}

-(void)initImageOne{
    _layerView = [[UIView alloc]initWithFrame:CGRectMake(self.width*7/16, self.height*7/16, self.width/8, self.height/8)];
    [self.view addSubview:_layerView];
    _smallImage = [UIImage imageNamed:@"icon_qq"];
    
    
    _layerView.layer.contents = (__bridge id) _smallImage.CGImage; //直接给view的layer添加image当底图
    _layerView.layer.contentsGravity = kCAGravityResizeAspect;     // 设置排布模式为适应模式
    _layerView.layer.contentsScale = [UIScreen mainScreen].scale;   //设置放大系数，只要由是否是retain屏幕决定
    _layerView.layer.masksToBounds = YES; //超出边界的裁剪掉
    _layerView.layer.contentsCenter = CGRectMake(0.0, 0.0, 0.8, 0.8); //裁剪拉伸区域外的，其实我也不大懂，这个东西好奇怪！
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
