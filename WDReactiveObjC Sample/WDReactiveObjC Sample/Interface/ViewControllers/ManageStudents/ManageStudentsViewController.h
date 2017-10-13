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
#import "Student.h"
#import "WDReactiveObjC.h"

@interface ManageStudentsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
{
    int editingIndex;
}

@property (weak, nonatomic) IBOutlet UITableView *myTable;

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UIStepper *ageStepper;

@property (weak, nonatomic) IBOutlet UITextField *editFirstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *editLastNameTextField;
@property (weak, nonatomic) IBOutlet UILabel *editAgeLabel;
@property (weak, nonatomic) IBOutlet UIStepper *editAgeStepper;

- (IBAction)addNewStudent:(id)sender;
- (IBAction)saveEdit:(id)sender;
- (IBAction)deleteStudent:(id)sender;

@property (retain, nonatomic) WDReactiveString* reactiveString;
@property (retain, nonatomic) WDReactiveMutableArray<Student*>* reactiveStudents;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
- (IBAction)stepperAction:(id)sender;

@end


