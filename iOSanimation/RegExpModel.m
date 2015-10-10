//
//  RegExpModel.m
//  比呀比
//
//  Created by mac on 15/2/9.
//  Copyright (c) 2015年 Qu114. All rights reserved.
//

#import "RegExpModel.h"

@implementation RegExpModel
-(id)initWithType:(int)type AndRegExpForUrl:(NSString *)regexpforurl AndRegExpForParam:(NSString *)regexpforparam{
    if (self=[super init]) {
        self.Type = type;
        self.RegExpForUrl = regexpforurl;
        self.RegExpForParam = regexpforparam;
    }
    return self;
}

+(id)RegExpModelWithType:(int)type AndRegExpForUrl:(NSString *)regexpforurl AndRegExpForParam:(NSString *)regexpforparam{
    return [[self alloc]initWithType:type AndRegExpForUrl:regexpforurl AndRegExpForParam:regexpforparam];

}

@end
