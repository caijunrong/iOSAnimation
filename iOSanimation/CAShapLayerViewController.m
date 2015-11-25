//
//  CAShapLayerViewController.m
//  iOSanimation
//
//  Created by caijunrong on 15/11/24.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "CAShapLayerViewController.h"

@interface CAShapLayerViewController ()

@property (nonatomic, strong) UIView *contentView;

@end

@implementation CAShapLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake([UIScreen mainScreen].bounds.size.width/2 + 10, [UIScreen mainScreen].bounds.size.width/2 )];
    
    [path addArcWithCenter:CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.width/2) radius:10 startAngle:0 endAngle:2*M_PI clockwise:YES];
    
    
    [path moveToPoint:CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.width/2 + 10)];
    
    [path addLineToPoint:CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.width/2+ 50)];
    
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor blackColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 3.0f;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;// 边缘线的类型
    //容易忘记加上这一步
    shapeLayer.path = path.CGPath;
    [self.contentView.layer addSublayer:shapeLayer];
    
    
    // 给这个layer添加动画效果
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.0;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [shapeLayer addAnimation:pathAnimation forKey:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width)];
        [_contentView setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:_contentView];
    }
    return _contentView;
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
