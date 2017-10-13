//
//  ViewController.h
//  WDReactiveObjC
//
//  Created by Vladimir Dinic on 7/23/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDReactiveString.h"
#import "WDReactiveNumber.h"
#import "WDReactiveMutableArray.h"
#import "WDReactiveObjC.h"
#import "WDReactiveUserDefaults.h"

@interface BasicExampleViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@property (retain, nonatomic) WDReactiveString* reactiveTimeString;
@property (retain, nonatomic) WDReactiveString* reactiveString;
@property (retain, nonatomic) WDReactiveNumber* reactiveNumber;

- (IBAction)stepperAction:(id)sender;
- (IBAction)checkValue:(id)sender;

@end

