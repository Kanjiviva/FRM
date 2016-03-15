//
//  Food+helper.m
//  FridgeMeasure
//
//  Created by Steve on 2016-03-15.
//  Copyright © 2016 Steve. All rights reserved.
//

#import "Food+helper.h"

@implementation Food (helper)

- (NSString *)builderIdentifierWithDate:(NSDate *)date {
    NSTimeInterval interval = [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%f%@", interval, self.foodName];
}

+ (Food *)insertWithManageObjectContext:(NSManagedObjectContext *)context withName:(NSString *)name withDate:(NSDate *)date withUnit:(NSString *)unit withCategory:(NSString *)category {
    
    Food *food = [NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:context];
    food.foodName = name;
    food.date = date;
    food.unit = unit;
    food.category = name;
    food.identifier = [food builderIdentifierWithDate:[NSDate date]];
    return food;
}

+ (Food *)fetchWithContext:(NSManagedObjectContext *)context withIdentifier:(NSString *)identifier {
    NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:@"Food"];
    fetch.predicate = [NSPredicate predicateWithFormat:@"identifier == %@", identifier];
    NSError *fetchError = nil;
    NSArray *food = [context executeFetchRequest:fetch error:&fetchError];
    return food.firstObject;
}

+ (NSArray *)fetchWithContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:@"Food"];
    NSError *fetchError = nil;
    NSArray *food = [context executeFetchRequest:fetch error:&fetchError];
    return food;
}

@end
