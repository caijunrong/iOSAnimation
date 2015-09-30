//
//  Card.h
//  iOSanimation
//
//  Created by biyabi on 15/9/30.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

NS_ASSUME_NONNULL_BEGIN

@interface Card : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
@property (nonatomic, retain) NSString * no;
@property (nonatomic, retain) Person *person;
@end

NS_ASSUME_NONNULL_END

#import "Card+CoreDataProperties.h"
