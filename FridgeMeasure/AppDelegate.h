//
//  AppDelegate.h
//  FridgeMeasure
//
//  Created by Steve on 2016-03-13.
//  Copyright © 2016 Steve. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AppDelegateDelegate <NSObject>

- (void)didReceiveNotificationWithName:(NSString *)name;

@end

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (weak, nonatomic) id<AppDelegateDelegate> delegate;
@end

