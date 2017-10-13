//
//  ViewController.m
//  WDReactiveObjC
//
//  Created by Vladimir Dinic on 7/23/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

#import "BasicExampleViewController.h"

@interface BasicExampleViewController ()

@end

@implementation BasicExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.textField.text = @"Test";
    
    self.reactiveString = [[WDReactiveString alloc] initWith:self.textField.text];
    
    self.reactiveNumber = [[WDReactiveNumber alloc] initWith:@(0)];
    [[WDReactiveObjC sharedInstance] bind:self.reactiveNumber to:self.numberLabel];
    [[WDReactiveObjC sharedInstance] bind:self.reactiveString to:self.textLabel];
    
    self.reactiveTimeString = [[WDReactiveString alloc] initWith:[self stringFromDate:[NSDate date]]];
    [[WDReactiveObjC sharedInstance] bind:self.reactiveTimeString to:self.timeLabel];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self.reactiveTimeString setText:[self stringFromDate:[NSDate date]]];
    }];
}

- (IBAction)stepperAction:(id)sender {
    self.reactiveNumber.number = @(((UIStepper*)sender).value);
}

- (IBAction)checkValue:(id)sender
{
    self.reactiveString.text = self.textField.text;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField endEditing:YES];
    return YES;
}

-(NSString*)stringFromDate:(NSDate*)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];
    
    NSDate *currentDate = [NSDate date];
    NSString *dateString = [formatter stringFromDate:currentDate];
    return [NSString stringWithFormat:@"Current time: %@",dateString];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
