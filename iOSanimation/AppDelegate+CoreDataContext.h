//
//  AppDelegate+CoreDataContext.h
//  iOSanimation
//
//  Created by biyabi on 15/9/30.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (CoreDataContext)
- (void)createManagedObjectContext:(void (^)(NSManagedObjectContext *context))completion;

@end
