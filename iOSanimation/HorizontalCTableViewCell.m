//
//  HorizontalCTableViewCell.m
//  iOSanimation
//
//  Created by biyabi on 15/10/10.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "HorizontalCTableViewCell.h"

@implementation HorizontalCTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *cellID = @"BigImageTableViewCell";
    HorizontalCTableViewCell *hCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!hCell) {
        hCell = [[HorizontalCTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return hCell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
