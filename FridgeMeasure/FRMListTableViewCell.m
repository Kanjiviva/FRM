//
//  FRMListTableViewCell.m
//  FridgeMeasure
//
//  Created by Steve on 2016-03-14.
//  Copyright © 2016 Steve. All rights reserved.
//

#import "FRMListTableViewCell.h"

@interface FRMListTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *unitLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

@end

@implementation FRMListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFood:(Food *)food {
    _food = food;
    [self setup];
}

- (void)setup {
    self.nameLabel.text = self.food.foodName;
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    self.dateLabel.text = [dateFormatter stringFromDate:self.food.date];
    self.unitLabel.text = self.food.unit;
    self.categoryLabel.text = self.food.category;
    if (self.food.isExpired) {
        self.backgroundColor = [UIColor redColor];
    }
}

@end
