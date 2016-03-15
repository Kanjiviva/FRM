//
//  FRMCategoryTableViewCell.m
//  FridgeMeasure
//
//  Created by Steve on 2016-03-13.
//  Copyright © 2016 Steve. All rights reserved.
//

#import "FRMCategoryTableViewCell.h"

@interface FRMCategoryTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

@end

@implementation FRMCategoryTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCategory:(CategoryType *)category {
    _category = category;
    [self setup];
}

- (void)setup {
    self.categoryLabel.text = self.category.name;
}

@end
