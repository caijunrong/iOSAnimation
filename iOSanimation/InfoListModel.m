//
//  infoListModel.m
//  Biyabi
//
//  Created by mac on 14-3-13.
//  Copyright (c) 2014年 Qu114. All rights reserved.
//

#import "InfoListModel.h"
@implementation InfoListModel
@synthesize InfoTitle = _InfoTitle;
@synthesize MallName = _MallName;
@synthesize InfoTime = _InfoTime;
@synthesize CommodityPrice = _CommodityPrice;
-(id)initWithDict:(NSDictionary *)dictionary
{
if (self = [super init]) {
//    self.InfoID = dictionary[@"InfoID"];
//    NSString *tempInfoTitle = [dictionary[@"InfoTitle"] formatHtml];
//   
//    NSString *tempPrice = [dictionary[@"CommodityPrice"] formatHtml];
//
//    self.InfoTitle = tempInfoTitle;
//    self.CommodityPrice = tempPrice;
//    self.MainImage = dictionary[@"MainImage"];
//    NSString *tempMallName = [dictionary[@"MallName"] formatHtml];
//    
//    self.MallName =tempMallName;
//    self.BrightUrl = dictionary[@"BrightUrl"];
//    self.BrightName = dictionary[@"BrightName"];
//    self.IsGood = dictionary[@"IsGood"];
//    self.IsBad = dictionary[@"IsBad"];
//    self.InfoCollection = dictionary[@"InfoCollection"];
//    self.InfoReview = dictionary[@"InfoReview"];
//    self.InfoType = dictionary[@"InfoType"];
//    
//    NSString *time =  [dictionary[@"InfoTime"] formatTime];
//    
//    self.InfoTime = time;
//    self.UpdateTime = dictionary[@"UpdateTime"];
//    self.SaleStatus = dictionary[@"SaleStatus"];
//    self.IsTop = dictionary[@"IsTop"];
    
    [self setValuesForKeysWithDictionary:dictionary];
}
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

+(id)infoListModelWithDict:(NSDictionary *)dictionary

{
return [[self alloc]initWithDict:dictionary];
}
-(float)RowsHeight{

    

    return 205;
}
@end
