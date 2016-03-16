//
//  FRMListTableViewCellModel.h
//  FridgeMeasure
//
//  Created by Steve Sun on 2016-03-15.
//  Copyright © 2016 Steve. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Food;

@interface FRMListTableViewCellModel : NSObject

+ (NSString *)dateForFoodItem:(Food *)food;

@end
