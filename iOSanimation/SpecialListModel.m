//
//  SpecialListModel.m
//  Biyabi
//
//  Created by biyabi on 15/9/28.
//  Copyright © 2015年 biyabi. All rights reserved.
//

#import "SpecialListModel.h"

@implementation SpecialListModel

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary{
    return [[self alloc]initWithDict:dictionary];
}

- (instancetype)initWithDict:(NSDictionary *)dictionary{
    if (self = [super init]) {
//        [self setValuesForKeysWithDictionary:dictionary];
        _iSpecialID = [dictionary[@"iSpecialID"] intValue];
        _iParentSpecialID = [dictionary[@"iParentSpecialID"] intValue];
        _btSpecialType = [dictionary[@"btSpecialType"] intValue];
        _btSpecialLevel = [dictionary[@"btSpecialLevel"] intValue];
        _btRelationType = [dictionary[@"btRelationType"] intValue];
        _iOrderby = [dictionary[@"iOrderby"] intValue];
        _iOrderby = [dictionary[@"iOrderby"] boolValue];
        
        _strSpecialName = dictionary[@"strSpecialName"];
        _strSpecialImage = dictionary[@"strSpecialImage"];
        _strSpecialDetailImage = dictionary[@"strSpecialDetailImage"];
        _strSpecialContent = dictionary[@"strSpecialContent"];
        _strParentSpecialName = dictionary[@"strParentSpecialName"];
    }
    return self;
}



@end
