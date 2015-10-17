//
//  HorizontalCollectonTableViewController.m
//  iOSanimation
//
//  Created by biyabi on 15/10/10.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "HorizontalCollectonTableViewController.h"
#import "SpecialListModel.h"
#import "InfoListModel.h"

#import "BigImageTableViewCell.h"
#import "HorizontalCTableViewCell.h"

#import <UIImageView+WebCache.h>//这个地方移到项目的话需要修改



@interface HorizontalCollectonTableViewController ()
@property (nonatomic, strong) NSMutableArray *specilArray;
@end

@implementation HorizontalCollectonTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    //初始化一批model来用
    _specilArray = [[NSMutableArray alloc]init];
    
    for (int t = 0; t < 5; t++) {
        
        SpecialListModel *sModel = [[SpecialListModel alloc]init];
        sModel.strSpecialImage = @"http://pic.biyabi.com/image/2015/10/10/20151010095611_5444_3251.jpg";

        NSMutableArray *infoListarray = [[NSMutableArray alloc]init];
        for (int i = 0; i < 12; i++) {
            
            InfoListModel *lmodel = [[InfoListModel alloc]init];
            lmodel.InfoTitle = @"这是用来做测试的title";
            lmodel.InfoID = @"315456";
            lmodel.CommodityPrice = @"$456.84";
            lmodel.MainImage = @"http://pic.biyabi.com/image/2015/10/10/20151010162104_2476_8215_small.png";
            [infoListarray addObject:lmodel];
        }
        sModel.listRecommendInfo = infoListarray;
        [_specilArray addObject:sModel];
    }
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _specilArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)   indexPath{
    if (indexPath.row == 0) {
        return [UIScreen mainScreen].bounds.size.width/2;
    }else{
        return 190;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SpecialListModel *sModel = self.specilArray[indexPath.section];
    
    if (indexPath.row == 0) {
        
        BigImageTableViewCell *bigImageCell = [BigImageTableViewCell cellWithTableView:tableView];
        [bigImageCell.bigImageView sd_setImageWithURL:[NSURL URLWithString:sModel.strSpecialImage]];
        return bigImageCell;
    }else if (indexPath.row == 1) {
        HorizontalCTableViewCell *hoCell = [HorizontalCTableViewCell cellWithTableView:tableView];
        hoCell.modelArray = sModel.listRecommendInfo;
        [hoCell initCollectionCell];
        return hoCell;
    }else{
        NSLog(@"error tableview");
    }
    
    return nil;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
