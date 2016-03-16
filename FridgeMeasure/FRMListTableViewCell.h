//
//  FRMListTableViewCell.h
//  FridgeMeasure
//
//  Created by Steve on 2016-03-14.
//  Copyright © 2016 Steve. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FRMListTableViewCell : UITableViewCell

- (void)configureWithName:(NSString *)name withDate:(NSString *)date withUnit:(NSString *)unit withCategory:(NSString *)category isExpired:(BOOL)isExpired;

@end
