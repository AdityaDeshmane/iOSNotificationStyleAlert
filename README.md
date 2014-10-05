iOSNotificationStyleAlert
=========================

![      ](\alertWithButtons.png "") ![      ](\alertWithoutButtons.png "") 


Custom iOSNotificationStyleAlert. Beautiful, light and easy to use custom alert.



* Completely different custom alert
* Easy to modify as per theme, easy to modify code

<em>This UI control can be used on all iPhones, iPods & iPads running iOS 5.0 and above.</em>

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

### How to use

#### Sample Codes

```obj-c

//1.  IMPORT
#import "ADCustomAlertViewController.h"



//2. CONFORM TO PROTOCOL
<ADCustomAlertDelegate> //both methods are optional don't confirm if you dont want to take any action



//3. HANDLE DELEGATE METHODS
#pragma mark -
#pragma mark ADCustomAlertDelegate Methods

- (void)customAlertView:(ADCustomAlertViewController *) adCustomAlert clickedButtonWithTitle:(NSString*) strTitle
{
    NSLog(@"customAlertView clickedButtonWithTitle: %@",strTitle);
}

- (void)customAlertViewTapped:(ADCustomAlertViewController *) adCustomAlert
{
    NSLog(@"customAlertViewTapped");
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

ADCustomAlertViewController works on iOS 5.0 & above versions and is compatible with ARC projects. There is no need of other frameworks/libraries

---
---

### Other details

* XCode : Developed using 5.1.1
* Base sdk used while development : 7.0
* Testing : iOS: 6,7   Devices : iPad & 3.5, 4 inch iphones

---
---

### Todo

* More animations
* Auto height adjustments
* Auto hide option

---
---
