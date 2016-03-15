//
//  FRMListTableViewController.m
//  FridgeMeasure
//
//  Created by Steve on 2016-03-13.
//  Copyright © 2016 Steve. All rights reserved.
//

#import "FRMListTableViewController.h"
#import "FRMListTableViewCell.h"
#import "Food+helper.h"
#import "DataStack.h"

@interface FRMListTableViewController ()

@property (strong, nonatomic) DataStack *dataStack;
@property (strong, nonatomic) NSMutableArray *listArray;

@end

@implementation FRMListTableViewController

#pragma mark - Life Cycle -

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataStack = [DataStack new];
    self.listArray = [NSMutableArray new];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(responseToNotification:)
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

- (void)setListArray:(NSMutableArray *)listArray {
    _listArray = listArray;
    [self.tableView reloadData];
}

#pragma mark - Private -

- (void)fetchListsData {
    
    self.listArray = [[Food fetchWithContext:self.dataStack.context] mutableCopy];
    
}

- (void)responseToNotification:(NSNotification *)notification {
    id object = notification.object;
    if ([object isKindOfClass:[Food class]]) {
        Food *food = object;
        food.isExpired = @YES;
        
        
        
        [self.tableView reloadData];
    }
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FRMListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
    
    Food *food = self.listArray[indexPath.row];
    cell.food = food;
    
    return cell;
}

#pragma mark - Table view delegate -

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Food *food = self.listArray[indexPath.row];
        
        [self.dataStack.context deleteObject:food];
        
        // Save
        
        [self.listArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
