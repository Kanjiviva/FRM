//
//  Food.m
//  FridgeMeasure
//
//  Created by Steve Sun on 2016-03-15.
//  Copyright © 2016 Steve. All rights reserved.
//

#import "Food.h"

@implementation Food

// Insert code here to add functionality to your managed object subclass

+ (Food *)insertWithManageObjectContext:(NSManagedObjectContext *)context withName:(NSString *)name withDate:(NSDate *)date withUnit:(NSString *)unit withCategory:(NSString *)category isExpired:(NSNumber *)isExpired {
    
    Food *food = [NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:context];
    food.foodName = name;
    food.date = date;
    food.unit = unit;
    food.category = category;
    food.isExpired = isExpired;
    return food;
}

+ (NSArray *)fetchWithContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:@"Food"];
    NSError *fetchError = nil;
    NSArray *food = [context executeFetchRequest:fetch error:&fetchError];
    return food;
}

@end
