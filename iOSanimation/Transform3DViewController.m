//
//  Transform3DViewController.m
//  iOSanimation
//
//  Created by biyabi on 15/10/25.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "Transform3DViewController.h"

#import <GLKit/GLKit.h>

@interface Transform3DViewController ()

@property (nonatomic, weak) IBOutlet UIView *contianVIew;

@property (nonatomic, strong) IBOutletCollection(UIView) NSArray *faces;

@end

@implementation Transform3DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    [self.containerView setFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width)];
    //    [self.containerView setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    //
    //    [self.view addSubview:self.containerView];
    
    NSLog(@"faces:%@",self.faces);
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0/500.0;
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
    self.view.layer.sublayerTransform = perspective;
    
    //加入第一个
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);
    [self addFace:0 withTransform:transform];
    
    //加入第二个
    CATransform3D transform2 = CATransform3DMakeTranslation(100, 0, 0);
    transform2 = CATransform3DRotate(transform2, M_PI_2, 0, 1, 0);
    [self addFace:1 withTransform:transform2];
    
    //加入第三个
    CATransform3D transform3 = CATransform3DMakeTranslation(0, -100, 0);
    transform3 = CATransform3DRotate(transform3, M_PI_2, 1, 0, 0);
    [self addFace:2 withTransform:transform3];
    
    //加入第四个
    CATransform3D transform4 = CATransform3DMakeTranslation(0, 100, 0);
    transform4 = CATransform3DRotate(transform4, -M_PI_2, 1, 0, 0);
    [self addFace:3 withTransform:transform4];
    
    //加入第五个
    CATransform3D transform5 = CATransform3DMakeTranslation(-100, 0, 0);
    transform5 = CATransform3DRotate(transform5, -M_PI_2, 0, 1, 0);
    [self addFace:4 withTransform:transform5];
    
    //加入第六个
    CATransform3D transform6 = CATransform3DMakeTranslation(0, 0, -100);
    transform6 = CATransform3DRotate(transform6, -M_PI_2, 0, 0, 1);
    [self addFace:5 withTransform:transform6];
}

- (void)addFace:(NSInteger)index withTransform:(CATransform3D)transform
{
    //get the face view and add it to the container
    UIView *face = self.faces[index];
    [self.view addSubview:face];
    //center the face view within the container
    CGSize containerSize = self.view.bounds.size;
    face.center = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);
    // apply the transform
    face.layer.transform = transform;
    
    [self applyLightingToFace:face.layer];
    
    
}

//光源的位置
#define LIGHT_DIRECTION 0, 1, -0.5

//光源的强弱 越小越弱，看起来越黑
#define AMBIENT_LIGHT 0.5

//增加光影效果
- (void)applyLightingToFace:(CALayer *)face
{
    //add lighting layer
    CALayer *layer = [CALayer layer];
    layer.frame = face.bounds;
    [face addSublayer:layer];
    //convert the face transform to matrix
    //(GLKMatrix4 has the same structure as CATransform3D)
    //译者注：GLKMatrix4和CATransform3D内存结构一致，但坐标类型有长度区别，所以理论上应该做一次float到CGFloat的转换
    CATransform3D transform = face.transform;
    GLKMatrix4 matrix4 = *(GLKMatrix4 *)&transform;
    GLKMatrix3 matrix3 = GLKMatrix4GetMatrix3(matrix4);
    //get face normal
    GLKVector3 normal = GLKVector3Make(0, 0, 1);
    normal = GLKMatrix3MultiplyVector3(matrix3, normal);
    normal = GLKVector3Normalize(normal);
    //get dot product with light direction
    GLKVector3 light = GLKVector3Normalize(GLKVector3Make(LIGHT_DIRECTION));
    float dotProduct = GLKVector3DotProduct(light, normal);
    //set lighting layer opacity
    CGFloat shadow = 1 + dotProduct - AMBIENT_LIGHT;
    UIColor *color = [UIColor colorWithWhite:0 alpha:shadow];
    layer.backgroundColor = color.CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
