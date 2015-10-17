//
//  LYViewController.m
//  CAAnimationDemo
//
//  Created by luyao's IMac on 7/31/15.
//  Copyright (c) 2015 luyao's IMac. All rights reserved.
//

#define  ScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define  ScreenHeight  [[UIScreen mainScreen] bounds].size.height

#import "LYViewController.h"
#import "UIView+Extension.h"

@interface LYViewController()
@property(nonatomic,strong) UIImageView *bagView;
@property(nonatomic,strong) NSMutableArray *iconMoneyTagArray;
@end

@implementation LYViewController
-(void)viewDidLoad
{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title =_navTitle;
    [self initAnimation];
}

#pragma -mark lazy loading
- (UIImageView *)bagView{
    if (!_bagView) {
        _bagView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_hongbao_bags"]];
        _bagView.frame =CGRectMake(0,0,129, 168);
        _bagView.center=CGPointMake(CGRectGetMidX(self.view.frame)+20,CGRectGetMidY(self.view.frame));
    }
    return _bagView;
}

-(NSMutableArray *)iconMoneyTagArray
{
    if (!_iconMoneyTagArray) {
        _iconMoneyTagArray =[NSMutableArray array];
    }
    return _iconMoneyTagArray;
}

-(void)initAnimation
{
    switch (_animationType) {
        case AnimationTypeCAAnimationGroup:
            [self showCAAnimationGroup];
            break;
        case AnimationTypeCAKeyframeAnimation:
            [self showCAKeyframeAnimation];
            break;
         case AnimationTypeUIViewAnimation:
            [self showUIViewAnimation];
            break;
            case AnimationTypeCABasicAnimation:
            [self showCABasicAnimation];
            break;
        default:
            break;
    }
}

-(void)showCAAnimationGroup
{

}

-(void)showCAKeyframeAnimation
{

    [self.view addSubview:self.bagView];
    self.bagView.y=ScreenHeight-self.bagView.height;
    
    CAKeyframeAnimation *layerAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    layerAnimation.repeatCount=MAXFLOAT;
    layerAnimation.values=@[@265,@250,@260,@250,@255,@250,@253,@250,@257];
    layerAnimation.keyTimes=@[@0.1,@0.2,@0.3,@0.4,@0.5,@0.6,@0.7,@0.8,@0.9,@1.0];
    layerAnimation.calculationMode = kCAAnimationLinear;
    layerAnimation.duration=1.0;
    [self.bagView.layer addAnimation:layerAnimation forKey:@"drawAnimation"];
    
    
   CALayer *rectLayer = [[CALayer alloc] init];
    rectLayer.frame = CGRectMake(15, 200, 30, 30);
    rectLayer.cornerRadius = 15;
    rectLayer.backgroundColor = [[UIColor blackColor] CGColor];
    [self.view.layer addSublayer:rectLayer];
    
    CAKeyframeAnimation *rectRunAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    rectRunAnimation.values=@[[NSValue valueWithCGPoint:rectLayer.frame.origin],[NSValue valueWithCGPoint:CGPointMake(rectLayer.frame.origin.x+30, rectLayer.frame.origin.y)],[NSValue valueWithCGPoint:CGPointMake(ScreenWidth-15, rectLayer.frame.origin.y)],[NSValue valueWithCGPoint:CGPointMake(ScreenWidth-15, rectLayer.frame.origin.y+CGRectGetHeight(self.bagView.frame))],[NSValue valueWithCGPoint:CGPointMake(ScreenWidth-45, rectLayer.frame.origin.y+CGRectGetHeight(self.bagView.frame))],[NSValue valueWithCGPoint:CGPointMake(rectLayer.frame.origin.x, rectLayer.frame.origin.y+CGRectGetHeight(self.bagView.frame))],[NSValue valueWithCGPoint:rectLayer.frame.origin]];
    rectRunAnimation.keyTimes=@[@0.0,@0.15,@0.35,@0.5,@0.75,@0.9,@1.0];
    rectRunAnimation.calculationMode = kCAAnimationLinear;
    rectRunAnimation.duration=3.0;
    rectRunAnimation.repeatCount=MAXFLOAT;
    [rectLayer addAnimation:rectRunAnimation forKey:@"RectangleAnimation"];
}

-(void)showUIViewAnimation
{
    for (int i=0; i<200; i++)
    {
        [self performSelector:@selector(createObj:) withObject:[NSNumber numberWithInt:i] afterDelay:0.1*i];
    }
}

-(void)createObj:(NSNumber *)num
{
    [self.view addSubview:self.bagView];
  
    UIImageView *iconMoneyView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"icon_coin_%i",(([num intValue]+1)%2)+1]]];
    iconMoneyView.tag=[num integerValue];
    [self.iconMoneyTagArray addObject:num];
    iconMoneyView.frame=CGRectMake(0, 100, 20, 20);
    [self.view addSubview:iconMoneyView];
    CGPoint from =CGPointMake(0+rand()%50, 100+rand()%100);
    CGPoint center =CGPointMake(100+rand()%50,200);
    CGPoint to =CGPointMake(200+rand()%20, 500);
    [self throwObj:iconMoneyView From:from To:to center:center Duration:rand()%100/50];
}

-(void)throwObj:(id)object From:(CGPoint)from To:(CGPoint)to  center:(CGPoint)center Duration:(NSTimeInterval)duration
{
    UIBezierPath * bePath = [UIBezierPath bezierPath];
    [bePath moveToPoint:from];
    [bePath addQuadCurveToPoint:to controlPoint:center];
    
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = bePath.CGPath;
    animation.duration = duration;
    animation.delegate = self;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [((UIImageView *)object).layer addAnimation:animation forKey:@"animation parabola"];
}

-(void)showCABasicAnimation
{
    [self.view addSubview:self.bagView];
    
    CABasicAnimation *shake =[CABasicAnimation  animationWithKeyPath:@"transform.rotation.z"];
    shake.fromValue = [NSNumber numberWithFloat:-0];
    shake.toValue = [NSNumber numberWithFloat:2*3.14];
    shake.autoreverses =NO;
    shake.repeatCount=10;
    shake.duration =0.5;
    [self.bagView.layer addAnimation:shake forKey:@"animation shake"];
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    UIImageView *iconMoneyView =(UIImageView *)[self.view viewWithTag:[[self.iconMoneyTagArray firstObject] integerValue]];
    [iconMoneyView removeFromSuperview];
    
    
    [_iconMoneyTagArray removeObjectAtIndex:0];
    
    
}
@end

