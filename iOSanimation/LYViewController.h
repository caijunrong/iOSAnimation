//
//  LYViewController.h
//  CAAnimationDemo
//
//  Created by luyao's IMac on 7/31/15.
//  Copyright (c) 2015 luyao's IMac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
AnimationTypeCAKeyframeAnimation=0,
AnimationTypeCAAnimationGroup,
AnimationTypeUIViewAnimation,
AnimationTypeCABasicAnimation
}AnimationType;


@interface LYViewController : UIViewController
@property(nonatomic,strong) NSString *navTitle;
@property(nonatomic) AnimationType animationType;
@end
