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

- (void)configureWithName:(NSString *)name withDate:(NSString *)date withUnit:(NSString *)unit withCategory:(NSString *)category isExpired:(BOOL)isExpired {
    self.nameLabel.text = name;
    
    
    self.dateLabel.text = date;
    self.unitLabel.text = unit;
    self.categoryLabel.text = category;
    if (isExpired) {
        self.backgroundColor = [UIColor redColor];
    } else {
        self.backgroundColor = [UIColor whiteColor];
    }
}

@end
