//
//  ADCustomAlertViewController.h
//  iOSNotificationStyleAlert
//
//  Created by Aditya Deshmane on 05/10/14.
//  Copyright (c) 2014 Aditya Deshmane. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ADCustomAlertViewController;

@protocol ADCustomAlertDelegate<NSObject>

@optional

//callback provides alert instance and button title info
- (void)customAlertView:(ADCustomAlertViewController *) adCustomAlert clickedButtonWithTitle:(NSString*) strTitle;

//get called only if no buttonTitle array provided (buttonless alert)
- (void)customAlertViewTapped:(ADCustomAlertViewController *) adCustomAlert;

@end




@interface ADCustomAlertViewController : UIViewController

//initialization method
- (id)initWithTitle:(NSString*) strTitle
            message:(NSString *)strMessage
           delegate:(id)delegate
  arrayButtonTitles:(NSArray *) arrButtonTitles;

//shows alert
- (void) show;

@end
