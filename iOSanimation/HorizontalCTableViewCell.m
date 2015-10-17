//
//  HorizontalCTableViewCell.m
//  iOSanimation
//
//  Created by biyabi on 15/10/10.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "HorizontalCTableViewCell.h"
#import "InfoListModel.h"
#import <UIImageView+WebCache.h>
#import "SpecialHorizontalCollectionViewCell.h"

@implementation HorizontalCTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *cellID = @"HorizontalCTableViewCell";
    HorizontalCTableViewCell *hCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!hCell) {
        hCell = [[HorizontalCTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return hCell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
//        [self initCollectionCell];
    }
    return self;
}

-(void)initCollectionCell{
    
    _horizontalSpace = 16;
    
    UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = _horizontalSpace;
    flowLayout.sectionInset = UIEdgeInsetsMake(16, 16, 10, 16);
//    flowLayout.itemSize = CGSizeMake(50, 50);
    // 5.设置四周的内边距
//    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    UICollectionView *myCollectionView;
    
    myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 190) collectionViewLayout:flowLayout];
    
    myCollectionView.delegate = self;
    myCollectionView.dataSource = self;
    myCollectionView.showsHorizontalScrollIndicator = NO;
    myCollectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];

    
    
//    [myCollectionView registerClass:[SpecialHorizontalCollectionViewCell class] forCellWithReuseIdentifier:@"SpecialHorizontalCollectionViewCell"];
    [myCollectionView registerNib:[UINib nibWithNibName:@"SpecialHorizontalCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"SpecialHorizontalCollectionViewCell"];
    
    [self.contentView addSubview:myCollectionView];
    self.myCollectionView = myCollectionView;
    
    
}

//没有调用
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 164);
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"_modelArray.count:%ld",_modelArray.count);
    return _modelArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SpecialHorizontalCollectionViewCell *tcell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SpecialHorizontalCollectionViewCell" forIndexPath:indexPath];
    if (tcell == nil) {
        NSLog(@"--");
    }
    InfoListModel *iModel = self.modelArray[indexPath.row];
    [tcell.titleImage setBackgroundColor:[UIColor whiteColor]];
    [tcell.titleImage sd_setImageWithURL:[NSURL URLWithString:iModel.MainImage]];
    [tcell.titleName setText:iModel.InfoTitle];
    [tcell.priceString setText:[NSString stringWithFormat:@"%@",iModel.CommodityPrice]];
    
    return tcell;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
