//
//  Food.h
//  FridgeMeasure
//
//  Created by Steve Sun on 2016-03-15.
//  Copyright © 2016 Steve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Food : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
+ (Food *)insertWithManageObjectContext:(NSManagedObjectContext *)context withName:(NSString *)name withDate:(NSDate *)date withUnit:(NSString *)unit withCategory:(NSString *)category;
+ (NSArray *)fetchWithContext:(NSManagedObjectContext *)context;


@end

NS_ASSUME_NONNULL_END

#import "Food+CoreDataProperties.h"
