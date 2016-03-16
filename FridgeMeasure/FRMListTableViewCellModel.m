//
//  FRMListTableViewCellModel.m
//  FridgeMeasure
//
//  Created by Steve Sun on 2016-03-15.
//  Copyright © 2016 Steve. All rights reserved.
//

#import "FRMListTableViewCellModel.h"
#import "Food.h"

@implementation FRMListTableViewCellModel

+ (NSString *)dateForFoodItem:(Food *)food {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    return [dateFormatter stringFromDate:food.date];
}

@end
