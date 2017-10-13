//
//  ManageArraysViewController.h
//  WDReactiveObjC Sample
//
//  Created by Vladimir Dinic on 9/24/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDReactiveObjC.h"
#import "WDReactiveString.h"
#import "WDReactiveMutableArray.h"

@interface ManageArraysViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
{
    int editingIndex;
}

@property (weak, nonatomic) IBOutlet UITableView *myTable;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *editTableItemTextField;

@property (retain, nonatomic) WDReactiveNumber* reactiveNumber;
@property (retain, nonatomic) WDReactiveString* reactiveString;
@property (retain, nonatomic) WDReactiveMutableArray<WDReactiveNSObject*>* reactiveArray;

- (IBAction)checkValue:(id)sender;
- (IBAction)saveEdit:(id)sender;
- (IBAction)deleteItemPressed:(id)sender;

@end
