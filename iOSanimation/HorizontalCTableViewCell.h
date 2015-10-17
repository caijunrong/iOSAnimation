//
//  HorizontalCTableViewCell.h
//  iOSanimation
//
//  Created by biyabi on 15/10/10.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizontalCTableViewCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic) CGFloat horizontalSpace;
@property (nonatomic, strong) NSMutableArray *modelArray;
@property (nonatomic, strong) UICollectionView *myCollectionView;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
-(void)initCollectionCell;
@end
