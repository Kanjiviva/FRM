//
//  FRMListTableViewController.m
//  FridgeMeasure
//
//  Created by Steve on 2016-03-13.
//  Copyright © 2016 Steve. All rights reserved.
//

#import "FRMListTableViewController.h"
#import "FRMListTableViewCell.h"
#import "Food.h"
#import "DataStack.h"
#import "FRMListTableViewCellModel.h"

@interface FRMListTableViewController () <UISearchBarDelegate>

@property (strong, nonatomic) NSMutableArray *listArray;
@property (strong, nonatomic) NSMutableArray *filterArray;
@property (assign) BOOL isFiltered;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation FRMListTableViewController

#pragma mark - Life Cycle -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.listArray = [NSMutableArray new];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(responseToNotification)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(responseToNotification)
                                                 name:@"FoodExpired"
                                               object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self fetchListsData];
}

#pragma mark - IBActions -

- (IBAction)emptyExpiredButtonTapped:(UIBarButtonItem *)sender {
    
    NSMutableArray *toDelete = [NSMutableArray new];
    
    for (Food *food in self.listArray) {
        if (food.isExpired.boolValue) {
            [[DataStack sharedManager] deleteObject:food];
            [toDelete addObject:food];
        }
    }
    [[DataStack sharedManager] save];
    
    [self.listArray removeObjectsInArray:toDelete];
    
    [self.tableView reloadData];
}

- (IBAction)cancelButtonTapped:(UIButton *)sender {
    self.searchBar.text = @"";
    [self.searchBar resignFirstResponder];
    self.isFiltered = NO;
    [self.tableView reloadData];
}

#pragma mark - Private -

- (void)fetchListsData {
    
    self.listArray = [[Food fetchWithContext:[DataStack sharedManager].context] mutableCopy];
    [self.tableView reloadData];
}

- (void)responseToNotification {
    
    [self.tableView reloadData];
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.isFiltered) {
        return [self.filterArray count];
    }
    
    return [self.listArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FRMListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    BOOL isExpired;
    
    if (self.isFiltered) {
        Food *food = self.filterArray[indexPath.row];
        isExpired = [food.date compare:[NSDate date]] == NSOrderedAscending;
        food.isExpired = [NSNumber numberWithBool:isExpired];
        [cell configureWithName:food.foodName
                       withDate:[FRMListTableViewCellModel dateForFoodItem:food]
                       withUnit:food.unit
                   withCategory:food.category
                      isExpired:food.isExpired];
    } else {
        Food *food = self.listArray[indexPath.row];
        isExpired = [food.date compare:[NSDate date]] == NSOrderedAscending;
        food.isExpired = [NSNumber numberWithBool:isExpired];
        [cell configureWithName:food.foodName
                       withDate:[FRMListTableViewCellModel dateForFoodItem:food]
                       withUnit:food.unit
                   withCategory:food.category
                      isExpired:isExpired];
    }
    
    return cell;
}

#pragma mark - Table view delegate -

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Food *food = self.listArray[indexPath.row];
        
        [[DataStack sharedManager] deleteObject:food];
        
        [[DataStack sharedManager] save];
        
        [self.listArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

#pragma mark - Search Bar Delegate -

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    if (searchText.length == 0) {
        self.isFiltered = NO;
    } else {
        self.isFiltered = YES;
        self.filterArray = [NSMutableArray array];
        
        for (Food *food in self.listArray) {
            
            NSString *foodName = food.foodName;
            
            NSRange foodNameRange = [foodName rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            if (foodNameRange.location != NSNotFound) {
                [self.filterArray addObject:food];
            }
        }
        
    }
    
    [self.tableView reloadData];
    
}

@end
