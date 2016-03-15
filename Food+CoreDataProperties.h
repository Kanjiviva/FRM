//
//  Food+CoreDataProperties.h
//  FridgeMeasure
//
//  Created by Steve on 2016-03-15.
//  Copyright © 2016 Steve. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Food.h"

NS_ASSUME_NONNULL_BEGIN

@interface Food (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *category;
@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *foodName;
@property (nullable, nonatomic, retain) NSString *unit;
@property (nullable, nonatomic, retain) NSNumber *isExpired;
@property (nullable, nonatomic, retain) NSString *identifier;

@end

NS_ASSUME_NONNULL_END
