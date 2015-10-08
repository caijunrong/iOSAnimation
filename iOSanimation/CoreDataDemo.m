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
        
        //插入数据
        [self insetData];

    }else if(button.tag == 2){
//        [self deleteData];
        //查询数据
        [self selectData];
        
    }

}

/*
 * 增加
 */
- (void)insetData{
    Person *ps = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:_objectContext];
    ps.name = @"Cjr5";
    ps.age = [NSNumber numberWithInteger:15];
    
    Card *cd = [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:_objectContext];
    cd.no = @"442122344783927893x";
    ps.card = cd;
    
    NSError *error;
    [self.objectContext save:&error];
    if (error) {
        NSLog(@"error le");
    }else{
        NSLog(@"InsertSuccess");
    }
}

/*
 * 删除
 */
- (void)deleteData{
    //一、直接全部删除
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:_objectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setIncludesPropertyValues:NO];
    [request setEntity:entity];
    NSError *error = nil;
    NSArray *datas = [_objectContext executeFetchRequest:request error:&error];
    if (!error && datas && [datas count])
    {
        for (NSManagedObject *obj in datas)
        {
            [_objectContext deleteObject:obj];
        }
        if (![_objectContext save:&error])
        {
            NSLog(@"error:%@",error);
        }
    }

    //二、只想删除某一个
//    //2.1先设置查询条件
//    NSEntityDescription *entity2 = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:_objectContext];
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@", @"Cjr2"];  //查询条件
//    NSSortDescriptor * sort = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];  //排序条件
//    
//    NSArray * sortDescriptors = [NSArray arrayWithObject: sort];
//    
//    NSFetchRequest * request2 = [[NSFetchRequest alloc] init];
//    [request2 setIncludesPropertyValues:YES];
//    [request2 setEntity: entity2];
//    [request2 setPredicate: predicate];
//    [request2 setSortDescriptors: sortDescriptors];
//    //2.2执行查询
//    NSError *error = nil;
//    NSArray *datas = [_objectContext executeFetchRequest:request2 error:&error];
//    NSLog(@"datas.count:%ld",datas.count);
//    if (!error && datas && [datas count])
//    {
//        [_objectContext deleteObject:[datas firstObject]];
//        if (![_objectContext save:&error])
//        {
//            NSLog(@"error:%@",error);
//        }else{
//            NSLog(@"success delete");
//        }
//    }else{
//        NSLog(@"error");
//    }
    
}



/*
 * 查询
 */
- (void)selectData{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    
    [fetchRequest setFetchLimit:5];
    [fetchRequest setFetchOffset:0];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:_objectContext];
    
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchArray = [_objectContext executeFetchRequest:fetchRequest error:&error];
    
    NSMutableArray *resultArray = [NSMutableArray array];
    
    for (Person *ps in fetchArray) {
        NSLog(@"ps-> name: %@",ps.name);
        [resultArray addObject:ps];
    }
    NSLog(@"resultArray个数:%ld",resultArray.count);
    

}


-(UIButton *)checkOutBtn{
    if (!_checkOutBtn) {
        _checkOutBtn = [[UIButton alloc]initWithFrame:CGRectMake(200, 100, 100, 50)];
        [_checkOutBtn setTitle:@"查询" forState:UIControlStateNormal];
        [_checkOutBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _checkOutBtn.tag = 2;
        [_checkOutBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _checkOutBtn;
}

-(UIButton *)insertBtn{
    if (!_insertBtn) {
        _insertBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
        [_insertBtn setTitle:@"插入" forState:UIControlStateNormal];
        [_insertBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _insertBtn.tag = 1;
        [_insertBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _insertBtn;
}
@end
