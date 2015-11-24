//
//  ADCustomAlertViewController.h
//  iOSNotificationStyleAlert
//
//  Created by Aditya Deshmane on 05/10/14.
//


//    DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//    Version 2, December 2004
//
//    Copyright (C) 2014 Aditya Deshmane
//
//    Everyone is permitted to copy and distribute verbatim or modified
//    copies of this license document, and changing it is allowed as long
//    as the name is changed.
//
//    DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//    TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
//
//    0. You just DO WHAT THE FUCK YOU WANT TO.



#import <UIKit/UIKit.h>

@class ADCustomAlertViewController;

@protocol ADCustomAlertDelegate<NSObject>

@optional

//callback provides alert instance and button title info
- (void)adCustomAlertView:(ADCustomAlertViewController *) adCustomAlert clickedButtonWithTitle:(NSString*) strTitle;

//get called only if no buttonTitle array provided (buttonless alert)
- (void)adCustomAlertViewTapped:(ADCustomAlertViewController *) adCustomAlert;

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
