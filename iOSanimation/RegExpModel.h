//
//  RegExpModel.h
//  比呀比
//
//  Created by mac on 15/2/9.
//  Copyright (c) 2015年 Qu114. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegExpModel : NSObject
@property(nonatomic)int Type;
@property(copy,nonatomic)NSString *RegExpForUrl;
@property(copy,nonatomic)NSString *RegExpForParam;
-(id)initWithType:(int)type AndRegExpForUrl:(NSString *)regexpforurl AndRegExpForParam:(NSString *)regexpforparam;
+(id)RegExpModelWithType:(int)type AndRegExpForUrl:(NSString *)regexpforurl AndRegExpForParam:(NSString *)regexpforparam;
@end
