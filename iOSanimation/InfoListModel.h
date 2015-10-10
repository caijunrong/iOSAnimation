//
//  infoListModel.h
//  Biyabi
//
//  Created by mac on 14-3-13.
//  Copyright (c) 2014年 Qu114. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InfoListModel : NSObject
@property (nonatomic,copy) NSString *InfoTitle; //信息标题
@property (nonatomic,copy) NSString * InfoID;                           //信息id
@property (nonatomic,copy) NSString *CommodityPrice;//价格
@property (nonatomic,copy) NSString *MainImage; //图片
@property (nonatomic,copy) NSString *MallName; //电商名
@property (nonatomic,copy) NSString *BrightUrl;//特色标签url
@property (nonatomic,copy) NSString *BrightName;//特色标签名
@property (nonatomic,copy) NSString * IsGood;                           //赞
@property (nonatomic,copy) NSString * IsBad;                            //踩
@property (nonatomic,copy) NSString * InfoCollection;                   //收藏数
@property (nonatomic,copy) NSString * InfoReview;                       //评论数
@property (nonatomic,copy) NSString * InfoType;                         //信息类型
@property (nonatomic,copy) NSString *InfoTime;   //发布时间
@property (nonatomic,copy) NSString *UpdateTime;//更新时间
@property (nonatomic,copy) NSString * SaleStatus;                       //销售状态
@property (nonatomic,copy) NSString *IsTop;
@property (nonatomic,copy) NSString *InfoUrl;
@property (nonatomic,copy) NSString *CatUrl;
@property (nonatomic, copy) NSString *IsPurchasing; //daigou
@property (nonatomic, copy) NSString *InfoNation;

-(id)initWithDict:(NSDictionary*)dictionary;
+(id)infoListModelWithDict:(NSDictionary*)dictionary;
-(float)RowsHeight;
@end
