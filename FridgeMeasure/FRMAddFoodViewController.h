//
//  FRMAddFoodViewController.h
//  FridgeMeasure
//
//  Created by Steve on 2016-03-13.
//  Copyright © 2016 Steve. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryType.h"

@protocol FRMAddFoodViewControllerDelegate <NSObject>

- (void)foodExpireNotification;

@end

@interface FRMAddFoodViewController : UIViewController

@property (strong, nonatomic) CategoryType *category;
@property (weak, nonatomic) id<FRMAddFoodViewControllerDelegate> delegate;

@end
