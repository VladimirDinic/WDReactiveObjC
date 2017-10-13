//
//  ManageArraysViewController.m
//  WDReactiveObjC Sample
//
//  Created by Vladimir Dinic on 9/24/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

#import "ManageArraysViewController.h"

@interface ManageArraysViewController ()

@end

@implementation ManageArraysViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.reactiveArray = [[WDReactiveMutableArray<WDReactiveProtocol> alloc] initWith:[[NSMutableArray<WDReactiveProtocol> alloc] initWithObjects:[[WDReactiveString alloc] initWith:@"Word 1"], [[WDReactiveString alloc] initWith:@"Word 2"], [[WDReactiveString alloc] initWith:@"Word 3"], nil]];
    [[WDReactiveObjC sharedInstance] bind:self.reactiveArray to:self.myTable];
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

- (IBAction)checkValue:(id)sender
{
    self.reactiveString.text = self.textField.text;
    [self.reactiveArray edit:^(NSMutableArray<WDReactiveProtocol>* array) {
        [array addObject:[[WDReactiveString alloc] initWith:self.textField.text]];
    }];
}

- (IBAction)saveEdit:(id)sender
{
    [[self.reactiveArray objectAtIndex:editingIndex] setText:self.editTableItemTextField.text];
}

- (IBAction)stepperAction:(id)sender {
    self.reactiveNumber.number = @([((UIStepper*)sender) value]);
}

- (IBAction)deleteItemPressed:(id)sender
{
    [self.reactiveArray edit:^(NSMutableArray<WDReactiveProtocol> * array) {
        [array removeObjectAtIndex:editingIndex];
    }];
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
    return [self.reactiveArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    [[WDReactiveObjC sharedInstance] bind:[self.reactiveArray objectAtIndex:(int)indexPath.row] to:cell.textLabel];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    editingIndex = (int)indexPath.row;
    [[WDReactiveObjC sharedInstance] bind:[self.reactiveArray objectAtIndex:(int)indexPath.row] to:self.editTableItemTextField];
}

@end
