//
//  BigImageTableViewCell.h
//  iOSanimation
//
//  Created by biyabi on 15/10/10.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BigImageTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *bigImageView;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
