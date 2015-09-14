//
//  NormalButtonShowVC.m
//  iOSanimation
//
//  Created by caijunrong on 15/8/10.
//  Copyright (c) 2015年 caijunrong. All rights reserved.
//

#import "NormalButtonShowVC.h"
#import "CustomNButton.h"

@interface NormalButtonShowVC ()

@end

@implementation NormalButtonShowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    CustomNButton *custongBtn = [CustomNButton button];
    custongBtn.tintColor = [UIColor blueColor];
    UIBarButtonItem *item  = [[UIBarButtonItem alloc]initWithCustomView:custongBtn];
    self.navigationItem.rightBarButtonItem = item;
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
