//
//  ADCustomAlertViewController.m
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



#import "ADCustomAlertViewController.h"

#define BTN_WIDTH   90
#define BTN_HEIGHT  25
#define BTN_SPACE   10
#define BTN_Y_POS   VIEW_HEIGHT-30

/*************************************************
 
 FOLLOWING ARE CONFIGURABLE UI FEATURES
 
 CONFIGURE THEM AS PER THEME / REQUIREMENTS
 
*************************************************/

#define VIEW_HEIGHT         130 //view height (min possible height is 100 with one line for message label)
#define VIEW_BG_COLOR       [UIColor whiteColor]

#define TITLE_TEXT_COLOR    [UIColor colorWithRed:64.0/255 green:224.0/255 blue:208.0/255 alpha:1]
#define MESSAGE_TEXT_COLOR  [UIColor darkGrayColor]

#define BTN_FONT            [UIFont fontWithName:@"Helvetica" size:13]
#define BTN_BG_COLOR        [UIColor colorWithRed:64.0/255 green:224.0/255 blue:208.0/255 alpha:1]

#define BOTTOM_LINE_COLOR   [UIColor colorWithRed:235.0/255 green:255.0/255 blue:255.0/255 alpha:1]

/************************************************/


@interface ADCustomAlertViewController ()
{
    
    //Alert subviews
    UILabel     *_lblTitle;
    UILabel     *_lblMessage;
    UIButton    *_btn0;
    UIButton    *_btn1;
    UIButton    *_btn2;
    
    //Initialzation parameters
    NSString    *_strTitle;
    NSString    *_strMessage;
    NSArray     *_arrButtonTitles;
    
    
    BOOL        _bIsShowingAlert;
    CGRect      _viewFrame;
    CGRect      _windowFrame;
    
    __weak id <ADCustomAlertDelegate>   _delegateCustomAlert;
    UITapGestureRecognizer              *_tapGestureRecognizer;
}

-(void) setupView;
-(void) setupLabels;
-(void) setupButtons;
-(void) setupBottomLine;

-(void)viewTapped:(UITapGestureRecognizer*)sender;
-(IBAction)btnPressed:(id)sender;

- (void) hide;

@end

@implementation ADCustomAlertViewController

#pragma mark - UIViewController

- (id)initWithTitle:(NSString*) strTitle
            message:(NSString *) strMessage
           delegate:(id) delegate
  arrayButtonTitles:(NSArray *) arrButtonTitles
{
    self = [super init];

    if (self)
    {
        NSLog(@"ADCustomAlertView :: init");
        
        UIWindow *window =      [[[UIApplication sharedApplication] windows] objectAtIndex:0];
        _windowFrame =          window.screen.bounds;
     
        _strTitle =             strTitle;
        _strMessage =           strMessage;
        _arrButtonTitles =      arrButtonTitles;
        _delegateCustomAlert =  delegate;
        
        [self setupView];
        [self setupLabels];
        [self setupButtons];
        [self setupBottomLine];
    }
    
    return self;
}

#pragma mark - UIComponent Setup

-(void) setupView
{
    [self.view setClipsToBounds:YES];
    [self.view setFrame:CGRectMake(0, 0, _windowFrame.size.width, 0)];
    [self.view setBackgroundColor:VIEW_BG_COLOR];
}

-(void) setupLabels
{
    _lblTitle =                 [[UILabel alloc] init];
    _lblTitle.text =            _strTitle;
    _lblTitle.font =            [UIFont fontWithName:@"Helvetica" size:14];
    _lblTitle.textColor =       TITLE_TEXT_COLOR;
    _lblTitle.backgroundColor = [UIColor clearColor];
    _lblTitle.textAlignment =   NSTextAlignmentCenter;
    _lblTitle.frame =           CGRectMake(8, 20, _windowFrame.size.width-8*2, 20);
    
    [self.view addSubview:_lblTitle];
    
    _lblMessage =               [[UILabel alloc] init];
    _lblMessage.text =          _strMessage;
    _lblMessage.font =          [UIFont fontWithName:@"Helvetica" size:12];
    _lblMessage.numberOfLines = 0;
    _lblMessage.textAlignment = NSTextAlignmentCenter;
    _lblMessage.textColor =     MESSAGE_TEXT_COLOR;
    _lblMessage.backgroundColor = [UIColor clearColor];
    _lblMessage.frame =         CGRectMake(8, 42, _windowFrame.size.width -8*2, VIEW_HEIGHT - 76);
    
    [self.view addSubview:_lblMessage];
}

-(void) setupButtons
{
    //TODO: Remove this hardcoding of frames
    
    if(_arrButtonTitles.count == 0)//No buttons use tap to dismiss alert
    {
        _tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
        [self.view addGestureRecognizer:_tapGestureRecognizer];
    }
    else if(_arrButtonTitles.count == 1)
    {
        _btn0 =                 [UIButton buttonWithType:UIButtonTypeCustom];
        _btn0.tag =             0;
        _btn0.titleLabel.font = BTN_FONT;
        _btn0.frame  =          CGRectMake(_windowFrame.size.width/2-BTN_WIDTH/2, BTN_Y_POS, BTN_WIDTH, BTN_HEIGHT);
        _btn0.backgroundColor = BTN_BG_COLOR;
        
        [_btn0 setTitle:[_arrButtonTitles objectAtIndex:0] forState:UIControlStateNormal];
        [_btn0 addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btn0];
    }
    else if(_arrButtonTitles.count == 2)
    {
        _btn0 =                 [UIButton buttonWithType:UIButtonTypeCustom];
        _btn0.tag =             0;
        _btn0.titleLabel.font = BTN_FONT;
        _btn0.frame  =          CGRectMake(_windowFrame.size.width/2-BTN_WIDTH -BTN_SPACE/2, BTN_Y_POS, BTN_WIDTH, BTN_HEIGHT);
        _btn0.backgroundColor = BTN_BG_COLOR;
        
        [_btn0 setTitle:[_arrButtonTitles objectAtIndex:0] forState:UIControlStateNormal];
        [_btn0 addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btn0];
        
        _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn1.tag =             1;
        _btn1.titleLabel.font = BTN_FONT;
        _btn1.frame  =          CGRectMake(_windowFrame.size.width/2+BTN_SPACE/2, BTN_Y_POS, BTN_WIDTH, BTN_HEIGHT);
        _btn1.backgroundColor = BTN_BG_COLOR;
        
        [_btn1 setTitle:[_arrButtonTitles objectAtIndex:1] forState:UIControlStateNormal];
        [_btn1 addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btn1];
    }
    else if (_arrButtonTitles.count == 3)
    {
        _btn0 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn0.tag =             0;
        _btn0.titleLabel.font = BTN_FONT;
        _btn0.frame  =          CGRectMake(_windowFrame.size.width/2-BTN_WIDTH/2 -BTN_SPACE-BTN_WIDTH, BTN_Y_POS, BTN_WIDTH, BTN_HEIGHT);
        _btn0.backgroundColor = BTN_BG_COLOR;
        
        [_btn0 setTitle:[_arrButtonTitles objectAtIndex:0] forState:UIControlStateNormal];
        [_btn0 addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btn0];
        
        _btn1 =                 [UIButton buttonWithType:UIButtonTypeCustom];
        _btn1.tag =             1;
        _btn1.titleLabel.font = BTN_FONT;
        _btn1.frame  =          CGRectMake(_windowFrame.size.width/2-BTN_WIDTH/2, BTN_Y_POS, BTN_WIDTH, BTN_HEIGHT);
        _btn1.backgroundColor = BTN_BG_COLOR;
        
        [_btn1 setTitle:[_arrButtonTitles objectAtIndex:1] forState:UIControlStateNormal];
        [_btn1 addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btn1];
        
        _btn2 =                 [UIButton buttonWithType:UIButtonTypeCustom];
        _btn2.tag =             2;
        _btn2.titleLabel.font = BTN_FONT;
        _btn2.frame  =          CGRectMake(_windowFrame.size.width/2+BTN_WIDTH/2+BTN_SPACE, BTN_Y_POS, BTN_WIDTH, BTN_HEIGHT);
        _btn2.backgroundColor = BTN_BG_COLOR;
        
        [_btn2 setTitle:[_arrButtonTitles objectAtIndex:2] forState:UIControlStateNormal];
        [_btn2 addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btn2];
    }
}

-(void) setupBottomLine
{
    UIView *bottomBorderView =          [[UIView alloc] init];
    bottomBorderView.frame =            CGRectMake(0, VIEW_HEIGHT-1, _windowFrame.size.width, 1);
    bottomBorderView.backgroundColor =  BOTTOM_LINE_COLOR;
    
    [self.view addSubview:bottomBorderView];
}

#pragma mark -
#pragma mark View Actions

- (void)viewTapped:(UITapGestureRecognizer*)sender
{
    [self hide];
    
    if ( _delegateCustomAlert && [_delegateCustomAlert respondsToSelector:@selector(adCustomAlertViewTapped:)])
    {
        [_delegateCustomAlert adCustomAlertViewTapped:self];
    }
}

-(IBAction)btnPressed:(id)sender
{
    [self hide];
    
    if ( _delegateCustomAlert && [_delegateCustomAlert respondsToSelector:@selector(adCustomAlertView:clickedButtonWithTitle:)])
    {
        UIButton *btn = (UIButton*)sender;
        [_delegateCustomAlert adCustomAlertView:self clickedButtonWithTitle:[_arrButtonTitles objectAtIndex:btn.tag]];
    }
}


#pragma mark -
#pragma mark Show/Hide

- (void) show
{
    //force on main thread
    if([[NSThread currentThread] isMainThread] == NO)
    {
        [self performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:NO];
        return;
    }
    
    if (_bIsShowingAlert)
        return;
    
    NSLog(@"ADCustomAlertView :: show");

    
    _bIsShowingAlert = YES;
    
    //set view ouside of window
    CGRect rect =       CGRectMake(0, -VIEW_HEIGHT, _windowFrame.size.width, VIEW_HEIGHT);
    self.view.frame =   rect;
    self.view.alpha =   0.4;
    UIWindow *window =  [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    
    [window addSubview:self.view];


    //bring view down with animation
    rect.origin.y = 0;
    
    //Block: Dissolve style animation
    void (^finishBlock)(BOOL finished) =
    ^(BOOL finished)
    {
        [UIView animateWithDuration:0.3 animations:
         ^{
            self.view.alpha = 1.0;
        }];
    };
    
    //Bring down view from top
    [UIView animateWithDuration:0.8
                     animations:^{ self.view.frame = rect;}
                     completion:finishBlock];
}

- (void) hide
{
    //force on main thread
    if([[NSThread currentThread] isMainThread] == NO)
    {
        [self performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:NO];
        return;
    }
    
    if(_bIsShowingAlert == NO)
        return;
    
    NSLog(@"ADCustomAlertView :: hide");

    
    _bIsShowingAlert = NO;

    //set view ouside of window
    CGRect rect = CGRectMake(0, -VIEW_HEIGHT, _windowFrame.size.width, VIEW_HEIGHT);;
    
    //move view up with animation
    [UIView animateWithDuration:0.5
                     animations:^{
                                    self.view.alpha = 0.8;
                                    self.view.frame = rect;
                                }
                     completion:^(BOOL finished){ [self.view removeFromSuperview];}];
}
@end
