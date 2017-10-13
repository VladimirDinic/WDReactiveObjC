//
//  DataObservingViewController.m
//  WDReactiveObjC Sample
//
//  Created by Vladimir Dinic on 9/25/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

#import "DataObservingViewController.h"

@interface DataObservingViewController ()

@end

@implementation DataObservingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.currentValueUserDefaultsLabel setText:[[NSUserDefaults standardUserDefaults] stringForKey:@"TestDefaults"]];
    self.reactiveUserDefaults = [[WDReactiveUserDefaults alloc] initWithUserDefaultsName:@"TestDefaults"];
    /*[self.reactiveUserDefaults observeWith:^(id newValue){
        NSLog(@"User defaults value changed");
        [self.currentValueUserDefaultsLabel setText:[[NSUserDefaults standardUserDefaults] stringForKey:@"TestDefaults"]];
    }];*/
    [[WDReactiveObjC sharedInstance] bind:self.reactiveUserDefaults to:self.currentValueUserDefaultsLabel];
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

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField endEditing:YES];
    return YES;
}

- (IBAction)updateUserDefaultsPressed:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setObject:self.userDefaultsValueTextField.text forKey:self.userDefaultsKeyTextField.text];
}

@end
