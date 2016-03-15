//
//  Food+helper.h
//  FridgeMeasure
//
//  Created by Steve on 2016-03-15.
//  Copyright © 2016 Steve. All rights reserved.
//

#import "Food.h"

@interface Food (helper)

- (NSString *)builderIdentifierWithDate:(NSDate *)date;
+ (Food *)insertWithManageObjectContext:(NSManagedObjectContext *)context withName:(NSString *)name withDate:(NSDate *)date withUnit:(NSString *)unit withCategory:(NSString *)category;
+ (Food *)fetchWithContext:(NSManagedObjectContext *)context withIdentifier:(NSString *)identifier;
+ (NSArray *)fetchWithContext:(NSManagedObjectContext *)context;

@end
