//
//  BigImageTableViewCell.m
//  iOSanimation
//
//  Created by biyabi on 15/10/10.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "BigImageTableViewCell.h"

@implementation BigImageTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *bigImageCellID = @"BigImageTableViewCell";
    BigImageTableViewCell *bCell = [tableView dequeueReusableCellWithIdentifier:bigImageCellID];
    if (!bCell) {
        bCell = [[BigImageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:bigImageCellID];
    }
    return bCell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.bigImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.width/2)];
        [self.bigImageView setContentMode:UIViewContentModeScaleAspectFill];
        [self.contentView addSubview:self.bigImageView];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
