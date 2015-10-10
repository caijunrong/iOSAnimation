//
//  HorizontalCTableViewCell.m
//  iOSanimation
//
//  Created by biyabi on 15/10/10.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "HorizontalCTableViewCell.h"
#import "SpecialHorizontalCollectionViewCell.h"

@implementation HorizontalCTableViewCell{
    UICollectionView *myCollectionView;
}

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
        [self initCollectionCell];
    }
    return self;
}

-(void)initCollectionCell{
    
    _horizontalSpace = 5;
    
    UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = _horizontalSpace;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout.itemSize = CGSizeMake(50, 50);
    // 5.设置四周的内边距
//    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width/4) collectionViewLayout:flowLayout];
    
    myCollectionView.delegate = self;
    myCollectionView.dataSource = self;
    myCollectionView.showsHorizontalScrollIndicator = NO;
    myCollectionView.backgroundColor = [UIColor blackColor];

    
    
//    [myCollectionView registerClass:[SpecialHorizontalCollectionViewCell class] forCellWithReuseIdentifier:@"SpecialHorizontalCollectionViewCell"];
    [myCollectionView registerNib:[UINib nibWithNibName:@"SpecialHorizontalCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"SpecialHorizontalCollectionViewCell"];
    
    [self.contentView addSubview:myCollectionView];
    
    
    
}

//没有调用
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(50, 50);
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _modelArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SpecialHorizontalCollectionViewCell *tcell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SpecialHorizontalCollectionViewCell" forIndexPath:indexPath];
    if (tcell == nil) {
        NSLog(@"--");
    }
    
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
