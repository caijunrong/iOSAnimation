//
//  SpecialListModel.h
//  Biyabi
//
//  Created by biyabi on 15/9/28.
//  Copyright © 2015年 biyabi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpecialListModel : NSObject
@property (nonatomic, assign) int iSpecialID;
@property (nonatomic, copy) NSString *strSpecialName;
@property (nonatomic, copy) NSString *strSpecialImage;
@property (nonatomic, copy) NSString *strSpecialDetailImage;
@property (nonatomic, copy) NSString *strSpecialContent;
@property (nonatomic, assign) int iParentSpecialID;
@property (nonatomic, copy) NSString *strParentSpecialName;
@property (nonatomic, assign) int btSpecialType;
@property (nonatomic, assign) int btSpecialLevel; //2 fu 1 zi 
@property (nonatomic, assign) int btRelationType;
@property (nonatomic, assign) BOOL bShowFlag;
@property (nonatomic, assign) int iOrderby;
@property (nonatomic, strong) NSMutableArray *listRecommendInfo;

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary;
- (instancetype)initWithDict:(NSDictionary *)dictionary;
@end
