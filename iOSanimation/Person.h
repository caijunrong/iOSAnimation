//
//  Person.h
//  iOSanimation
//
//  Created by biyabi on 15/9/30.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Card;

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) Card *card;


@end

NS_ASSUME_NONNULL_END

#import "Person+CoreDataProperties.h"
