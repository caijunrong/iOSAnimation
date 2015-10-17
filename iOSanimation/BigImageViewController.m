//
//  BigImageViewController.m
//  iOSanimation
//
//  Created by biyabi on 15/10/12.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "BigImageViewController.h"
#import "NSDataEx.h"

@interface BigImageViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIImage *fontImage;

@property (nonatomic, strong) UIImage *endImage;

@property (nonatomic, strong) NSMutableArray *imageArray;

@end

@implementation BigImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 120, 120)];
    
    [_imageView setImage:[UIImage imageNamed:@"bigimage.jpg"]];
    
    [self.view addSubview:_imageView];
    
    
    _fontImage = [UIImage imageNamed:@"bigimage.jpg"];
    
    NSData *fontData = UIImageJPEGRepresentation(_fontImage, 1.0f);
    NSString *fontStr = [fontData base64Encoding];
    NSLog(@"_fontImage:%ld",fontStr.length/1024);
    
    _endImage = [self compressImageWith:_fontImage];
    
    NSData *endData = UIImageJPEGRepresentation(_endImage, 1.0f);
    NSString *endStr = [endData base64Encoding];
    NSLog(@"_endImage:%ld",endStr.length/1024);

    
    
    NSLog(@"_imageArray:%d",(int)_imageArray.count);
    
}

//按比例缩小图片
- (UIImage *)compressImageWith:(UIImage *)image
{
    float imageWidth = image.size.width;
    float imageHeight = image.size.height;
    float width = 100;
    float height = image.size.height/(image.size.width/width);
    
    float widthScale = imageWidth /width;
    float heightScale = imageHeight /height;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    
    if (widthScale > heightScale) {
        [image drawInRect:CGRectMake(0, 0, imageWidth /heightScale , height)];
    }
    else {
        [image drawInRect:CGRectMake(0, 0, width , imageHeight /widthScale)];
    }
    
    // 从当前context中创建一个改变大小后的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    return newImage;
    
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
