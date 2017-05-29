iOSNotificationStyleAlert
=========================
Notification Style Alert

![      ](/iOSNotifStyleAlert.gif "") 

---
---

### Features

* Light and easy to use custom alert.
* Easy to modify code
* Easy to setup color theme
* Many customisation parameters

<em>This UI control can be used on all iPhones, iPods & iPads running iOS 5.0 and above.</em>

---
---

### Customisation parameters

```
#define VIEW_HEIGHT         130 //view height (min possible height is 100 with one line for message label)
#define VIEW_BG_COLOR       [UIColor whiteColor]

#define TITLE_TEXT_COLOR    [UIColor colorWithRed:64.0/255 green:224.0/255 blue:208.0/255 alpha:1]
#define MESSAGE_TEXT_COLOR  [UIColor darkGrayColor]

#define BTN_FONT            [UIFont fontWithName:@"Helvetica" size:13]
#define BTN_BG_COLOR        [UIColor colorWithRed:64.0/255 green:224.0/255 blue:208.0/255 alpha:1]

#define BOTTOM_LINE_COLOR   [UIColor colorWithRed:235.0/255 green:255.0/255 blue:255.0/255 alpha:1]

```

---
---

### Adding to your project

* Add Follwing two files to your project

```
'ADCustomAlertViewController.h'
'ADCustomAlertViewController.m'
```

---
---

### How to use ?

#### Sample Codes

```obj-c

//1.  IMPORT
#import "ADCustomAlertViewController.h"



//2. CONFORM TO PROTOCOL
<ADCustomAlertDelegate> //both methods are optional don't confirm if you dont want to take any action



//3. HANDLE DELEGATE METHODS
#pragma mark - ADCustomAlertDelegate Methods

- (void)adCustomAlertView:(ADCustomAlertViewController *) adCustomAlert clickedButtonWithTitle:(NSString*) strTitle
{
     NSLog(@"ADCustomAlertView :: clickedButtonWithTitle: %@",strTitle);
}

- (void)adCustomAlertViewTapped:(ADCustomAlertViewController *) adCustomAlert
{
    NSLog(@"ADCustomAlertView :: AlertViewTapped");
}

//4. CREATING INSTANCE OF CONTROL

//A. ALERT WITH BUTTONS

    _customAlert = [[ADCustomAlertViewController alloc] initWithTitle:@"Custom Alert Title"
                                                              message:@"This is small text message, just to show how this notification style alert looks !!!"
                                                             delegate:self
                                                    arrayButtonTitles:[[NSArray alloc] initWithObjects: @"OK",@"Cancel",nil]];
                                                    

//B. ALERT WITHOUT BUTTONS

    _customAlertWithoutButtons = [[ADCustomAlertViewController alloc] initWithTitle:@"Alert Without Buttons"
                                                                            message:@"Tap this view and it will disapper !!!"
                                                                           delegate:self
                                                                  arrayButtonTitles:nil];

//5. SHOWING ALERT

 [_customAlert show];
 [_customAlertWithoutButtons show];

```


---
---

### Requirements

* ADPageControl works on iOS 5.0 & above versions and is compatible with ARC projects. 
* There is no need of other frameworks/libraries.

---
---

### Other details

* Compatible devices : iPhone, iPad, iPod
* Testing : iOS 6, 7, 8 & 9

---
---

### TODO

* Component polishing
* More generalizations

---
---
## License

iOSNotificationStyleAlert is available under the WTFPL license. 

```
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

```
