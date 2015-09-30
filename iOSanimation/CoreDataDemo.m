//
//  CoreDataDemo.m
//  iOSanimation
//
//  Created by biyabi on 15/9/30.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "CoreDataDemo.h"
#import <CoreData/CoreData.h>
#import "Person.h"
#import "Card.h"
#import "AppDelegate.h"
#import "AppDelegate+CoreDataContext.h"

@interface CoreDataDemo ()

@property (weak, nonatomic) NSManagedObjectContext *objectContext;

@property (nonatomic, strong) UIButton *insertBtn;
@property (nonatomic, strong) UIButton *checkOutBtn;
@end

@implementation CoreDataDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.checkOutBtn];
    [self.view addSubview:self.insertBtn];
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    [appDelegate createManagedObjectContext:^(NSManagedObjectContext *context) {
        self.objectContext = context;
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)click:(UIButton *)button{
    if (button.tag == 1) {
        
        
    }else if(button.tag == 2){
        
        //插入数据
        [self insetData];
    }

}

- (void)insetData{
    Person *ps = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:_objectContext];
    ps.name = @"Cjr";
    ps.age = [NSNumber numberWithInteger:12];
    
    Card *cd = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:_objectContext];
    cd.no = @"44212234478392789x";
    ps.card = cd;
    
    NSError *error;
    [self.objectContext save:&error];
    if (error) {
        NSLog(@"error le");
    }else{
        NSLog(@"InsertSuccess");
    }
}

-(UIButton *)checkOutBtn{
    if (!_checkOutBtn) {
        _checkOutBtn = [[UIButton alloc]initWithFrame:CGRectMake(200, 100, 100, 50)];
        [_checkOutBtn setTitle:@"查询" forState:UIControlStateNormal];
        [_checkOutBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _checkOutBtn.tag = 1;
        [_checkOutBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _checkOutBtn;
}

-(UIButton *)insertBtn{
    if (!_insertBtn) {
        _insertBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
        [_insertBtn setTitle:@"插入" forState:UIControlStateNormal];
        [_insertBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _insertBtn.tag = 2;
        [_insertBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _insertBtn;
}
@end
