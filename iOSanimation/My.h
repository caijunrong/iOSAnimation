//
//  My.h
//  iOSanimation
//
//  Created by biyabi on 15/9/21.
//  Copyright (c) 2015年 caijunrong. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyDelegate <NSObject>

@optional
-(void)buyiPhone:(NSString *)iphoneType money:(NSString *)money;
@end

@interface My : NSObject
-(void)justTestModethod:(NSString *)str;
-(void)sendNoneMethod:(NSString *)str;
@property (nonatomic, weak) id<MyDelegate> delegate;
@end
