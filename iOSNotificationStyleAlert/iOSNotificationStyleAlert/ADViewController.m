//
//  ADViewController.m
//  iOSNotificationStyleAlert
//
//  Created by Aditya Deshmane on 05/10/14.
//  Copyright (c) 2014 Aditya Deshmane. All rights reserved.
//

#import "ADViewController.h"
#import "ADCustomAlertViewController.h"

@interface ADViewController ()<ADCustomAlertDelegate>
{
    ADCustomAlertViewController *_customAlert;
    ADCustomAlertViewController *_customAlertWithoutButtons;
}
@property (strong, nonatomic) IBOutlet UIButton *btnShowSimpleAlert;
@property (strong, nonatomic) IBOutlet UIButton *btnShowButtonlessAlert;

@end

@implementation ADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    //SIMPLE ALERT
    _customAlert = [[ADCustomAlertViewController alloc] initWithTitle:@"Custom Alert Title"
                                                              message:@"This is small text message, just to show how this notification style alert looks !!!"
                                                             delegate:self
                                                    arrayButtonTitles:[[NSArray alloc] initWithObjects: @"OK",@"Cancel",nil]];
    
    //BUTTONLESS ALERT
    _customAlertWithoutButtons = [[ADCustomAlertViewController alloc] initWithTitle:@"Alert Without Buttons"
                                                                            message:@"Tap this view and it will disapper !!!"
                                                                           delegate:self
                                                                  arrayButtonTitles:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
  
}

- (IBAction)showAlert:(id)sender//SIMPLE ALERT
{
    [_customAlert show];
    
    //Showing multiple alerts is also possible, but just for demo purpose disabed other button when one alert is shown
    _btnShowButtonlessAlert.enabled = NO;
    _btnShowButtonlessAlert.alpha = 0.5;
}

- (IBAction)showButtonlessAlert:(id)sender//BUTTONLESS ALERT
{
    [_customAlertWithoutButtons show];
    
    //Showing multiple alerts is also possible, but just for demo purpose disabed other button when one alert is shown
    _btnShowSimpleAlert.enabled = NO;
    _btnShowSimpleAlert.alpha = 0.5;
}

#pragma mark -
#pragma mark ADCustomAlertDelegate Methods

- (void)customAlertView:(ADCustomAlertViewController *) adCustomAlert clickedButtonWithTitle:(NSString*) strTitle
{
    //ReEnable
    _btnShowButtonlessAlert.enabled = YES;
    _btnShowButtonlessAlert.alpha = 1.0;
    NSLog(@"customAlertView clickedButtonWithTitle: %@",strTitle);
}

- (void)customAlertViewTapped:(ADCustomAlertViewController *) adCustomAlert
{
    //ReEnable
    _btnShowSimpleAlert.enabled = YES;
    _btnShowSimpleAlert.alpha = 1.0;
    NSLog(@"customAlertViewTapped");
}

@end
