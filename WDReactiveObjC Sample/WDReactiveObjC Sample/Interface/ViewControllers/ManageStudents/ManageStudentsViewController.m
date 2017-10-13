//
//  ViewController2.m
//  WDReactiveObjC
//
//  Created by Vladimir Dinic on 9/24/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

#import "ManageStudentsViewController.h"

@interface ManageStudentsViewController ()

@end

@implementation ManageStudentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    editingIndex = -1;
    
    self.reactiveStudents = [[WDReactiveMutableArray<WDReactiveProtocol> alloc] initWith:[[NSMutableArray<WDReactiveProtocol> alloc] initWithObjects:[[Student alloc] iniWithFirstName:@"Petar" lastName:@"Petrovic" andAge:24],[[Student alloc] iniWithFirstName:@"Jovan" lastName:@"Jovanovic" andAge:26], nil]];
    
    [[WDReactiveObjC sharedInstance] bind:self.reactiveStudents to:self.myTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)addNewStudent:(id)sender
{
    if (![self.firstNameTextField.text isEqualToString:@""] && ![self.lastNameTextField.text isEqualToString:@""])
    {
        [self.reactiveStudents edit:^(NSMutableArray<WDReactiveProtocol>* array)
         {
             [array addObject:[[Student alloc] iniWithFirstName:self.firstNameTextField.text lastName:self.lastNameTextField.text andAge:self.ageStepper.value]];
         }];
        self.firstNameTextField.text = @"";
        self.lastNameTextField.text = @"";
        self.ageLabel.text = [NSString stringWithFormat:@"%.0f",self.ageStepper.minimumValue];
    }
}

- (IBAction)saveEdit:(id)sender
{
    if (![self.editFirstNameTextField.text isEqualToString:@""] && ![self.editFirstNameTextField.text isEqualToString:@""])
    {
        if (editingIndex != -1 && [self.reactiveStudents count] > 0 && editingIndex < [self.reactiveStudents count])
        {
            [[[self.reactiveStudents objectAtIndex:editingIndex] firstName] setText:self.editFirstNameTextField.text];
            [[[self.reactiveStudents objectAtIndex:editingIndex] lastName] setText:self.editLastNameTextField.text];
            [[[self.reactiveStudents objectAtIndex:editingIndex] age] setNumber:@(self.editAgeStepper.value)];
        }
    }
}

- (IBAction)deleteStudent:(id)sender
{
    if (editingIndex != -1 && [self.reactiveStudents count] > 0 && editingIndex < [self.reactiveStudents count])
    {
        Student* student = [self.reactiveStudents objectAtIndex:editingIndex];
        [self.reactiveStudents edit:^(NSMutableArray<WDReactiveProtocol>* array) {
            [array removeObject:student];
        }];
    }
    editingIndex = -1;
}

- (IBAction)stepperAction:(id)sender {
    if (sender == self.ageStepper)
    {
        self.ageLabel.text = [NSString stringWithFormat:@"%.0f",self.ageStepper.value];
    }
    else if (sender == self.editAgeStepper)
    {
        self.editAgeLabel.text = [NSString stringWithFormat:@"%.0f",self.editAgeStepper.value];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField endEditing:YES];
    return YES;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.reactiveStudents count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    Student* student = [self.reactiveStudents objectAtIndex:(int)indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@ - %d",student.firstName.text, student.lastName.text, student.age.number.intValue];
    [student.firstName observeWith:^(id newValue){
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@ - %d",student.firstName.text, student.lastName.text, student.age.number.intValue];
    }];
    [student.lastName observeWith:^(id newValue){
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@ - %d",student.firstName.text, student.lastName.text, student.age.number.intValue];
    }];
    [student.age observeWith:^(id newValue){
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@ - %d",student.firstName.text, student.lastName.text, student.age.number.intValue];
    }];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    editingIndex = (int)indexPath.row;
    Student* student = [self.reactiveStudents objectAtIndex:editingIndex];
    [[WDReactiveObjC sharedInstance] bind:student.firstName to:self.editFirstNameTextField];
    [[WDReactiveObjC sharedInstance] bind:student.lastName to:self.editLastNameTextField];
    [[WDReactiveObjC sharedInstance] bind:student.age to:self.editAgeLabel];
    [[WDReactiveObjC sharedInstance] bind:student.age to:self.editAgeStepper];
}


@end
