//
//  FRMAddFoodViewController.m
//  FridgeMeasure
//
//  Created by Steve on 2016-03-13.
//  Copyright © 2016 Steve. All rights reserved.
//

#import "FRMAddFoodViewController.h"
#import "DataStack.h"
#import "Food+helper.h"

@interface FRMAddFoodViewController ()

#pragma mark - IBOutlets

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *unitTextField;

@property (strong, nonatomic) NSMutableArray *notificationsArray;
@property (strong, nonatomic) Food *food;

#pragma mark - Properties -

@property (strong, nonatomic) DataStack *dataStack;

@end

@implementation FRMAddFoodViewController

#pragma mark - Life Cycle -

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = self.category.name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Lazy Instantiation -

- (DataStack *)dataStack {
    if (!_dataStack) {
        _dataStack = [DataStack new];
    }
    return _dataStack;
}

- (NSMutableArray *)notificationsArray {
    if (!_notificationsArray) {
        _notificationsArray = [NSMutableArray new];
    }
    return _notificationsArray;
}

#pragma mark - Private -

- (void)showUnableToSaveAlert {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Oops!" message:@"Please fill up all the fields before you save" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [controller addAction:cancel];
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)setupLocalNotification {
    
    NSDate *pickerDate = [self.datePicker date];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = pickerDate;
    localNotification.alertBody = [NSString stringWithFormat:@"%@ is almost expired", self.nameTextField.text];
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    localNotification.userInfo = @{@"identifier" : self.food.identifier};
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
}

#pragma mark - IBActions -

- (IBAction)dateSelected:(UIDatePicker *)sender {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    self.dateLabel.text = [dateFormatter stringFromDate:self.datePicker.date];
    
}

- (IBAction)addButtonTapped:(UIBarButtonItem *)sender {
    
    if (![self.nameTextField.text isEqualToString:@""] && ![self.unitTextField.text isEqualToString:@""]) {
        
        self.food = [Food insertWithManageObjectContext:self.dataStack.context withName:self.nameTextField.text withDate:self.datePicker.date withUnit:self.unitTextField.text withCategory:self.category.name];
        
        // Save core data
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        [self setupLocalNotification];
    } else {
        [self showUnableToSaveAlert];
    }
    
}

@end
