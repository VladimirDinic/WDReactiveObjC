//
//  DataObservingViewController.h
//  WDReactiveObjC Sample
//
//  Created by Vladimir Dinic on 9/25/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDReactiveUserDefaults.h"
#import "WDReactiveObjC.h"

@interface DataObservingViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *currentValueUserDefaultsLabel;
@property (weak, nonatomic) IBOutlet UITextField *userDefaultsValueTextField;
@property (weak, nonatomic) IBOutlet UITextField *userDefaultsKeyTextField;

@property (retain, nonatomic) WDReactiveUserDefaults* reactiveUserDefaults;

- (IBAction)updateUserDefaultsPressed:(id)sender;

@end
