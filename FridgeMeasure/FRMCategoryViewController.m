//
//  ViewController.m
//  FridgeMeasure
//
//  Created by Steve on 2016-03-13.
//  Copyright © 2016 Steve. All rights reserved.
//

#import "FRMCategoryViewController.h"
#import "FRMCategoryTableViewCell.h"
#import "CategoryType.h"
#import "FRMAddFoodViewController.h"

@interface FRMCategoryViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *categoryArray;

@end

@implementation FRMCategoryViewController

#pragma mark - Life Cycle -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CategoryType *meat = [[CategoryType alloc] initWithName:@"肉類"];
    CategoryType *fruit = [[CategoryType alloc] initWithName:@"水果"];
    CategoryType *veggie = [[CategoryType alloc] initWithName:@"蔬菜"];
    CategoryType *dairy = [[CategoryType alloc] initWithName:@"奶類"];
    
    self.categoryArray = [[NSMutableArray alloc] initWithArray:@[meat, fruit, veggie, dairy]];
    
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings
                                                                         settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge)
                                                                         categories:nil]];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - UITableView Datesource -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.categoryArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FRMCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    CategoryType *category = self.categoryArray[indexPath.row];
    cell.category = category;
    
    return cell;
}

#pragma mark - UITableview Delegate -

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.view.frame.size.height / 4;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FRMAddFoodViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"FRMAddFoodViewController"];
    vc.category = self.categoryArray[indexPath.row];
    [self showViewController:vc sender:nil];
    
}

@end
