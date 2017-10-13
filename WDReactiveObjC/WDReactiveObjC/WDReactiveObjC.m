//
//  WDReactiveObjC.m
//  WDReactiveObjC
//
//  Created by Vladimir Dinic on 7/23/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

#import "WDReactiveObjC.h"

@implementation WDReactiveObjC

+ (instancetype)sharedInstance
{
    static WDReactiveObjC *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[WDReactiveObjC alloc] init];
    });
    return sharedInstance;
}

-(void)bind:(WDReactiveNSObject*)reactiveObject to:(UIView*)view;
{
    if ([reactiveObject isKindOfClass:[WDReactiveString class]])
    {
        WDReactiveString* reactiveString = (WDReactiveString*)reactiveObject;
        [self bindReactiveString:reactiveString to:view];
    }
    else if ([reactiveObject isKindOfClass:[WDReactiveNumber class]])
    {
        WDReactiveNumber* reactiveNumber = (WDReactiveNumber*)reactiveObject;
        [self bindReactiveNumber:reactiveNumber to:view];
    }
    else if ([reactiveObject isKindOfClass:[WDReactiveMutableArray class]])
    {
        WDReactiveMutableArray* reactiveArray = (WDReactiveMutableArray*)reactiveObject;
        [self bindReactiveArray:reactiveArray to:view];
    }
    else if ([reactiveObject isKindOfClass:[WDReactiveUserDefaults class]])
    {
        WDReactiveUserDefaults* reactiveUserDefaults = (WDReactiveUserDefaults*)reactiveObject;
        [self bindReactiveUserDefaults:reactiveUserDefaults to:view];
    }
}

-(void)bindReactiveString:(WDReactiveString*)reactiveString to:(UIView*)view
{
    if ([view isKindOfClass:[UILabel class]])
    {
        ((UILabel*)view).text = reactiveString.text;
        [reactiveString observeWith:^(id newValue){
            ((UILabel*)view).text = newValue;
        }];
    }
    else if ([view isKindOfClass:[UITextField class]])
    {
        ((UITextField*)view).text = reactiveString.text;
        [reactiveString observeWith:^(id newValue){
            ((UITextField*)view).text = newValue;
        }];
    }
    else if ([view isKindOfClass:[UITextView class]])
    {
        ((UITextView*)view).text = reactiveString.text;
        [reactiveString observeWith:^(id newValue){
            ((UITextView*)view).text = newValue;
        }];
    }
    else if ([view isKindOfClass:[UIButton class]])
    {
        [((UIButton*)view) setTitle:reactiveString.text forState:UIControlStateNormal];
        [reactiveString observeWith:^(id newValue){
            [((UIButton*)view) setTitle:newValue forState:UIControlStateNormal];
        }];
    }
}

-(void)bindReactiveNumber:(WDReactiveNumber*)reactiveNumber to:(UIView*)view
{
    if ([view isKindOfClass:[UILabel class]])
    {
        ((UILabel*)view).text = [NSString stringWithFormat:@"%@",reactiveNumber.number];
        [reactiveNumber observeWith:^(id newValue){
            ((UILabel*)view).text = [NSString stringWithFormat:@"%@",reactiveNumber.number];
        }];
    }
    else if ([view isKindOfClass:[UITextField class]])
    {
        ((UITextField*)view).text = [NSString stringWithFormat:@"%@",reactiveNumber.number];
        [reactiveNumber observeWith:^(id newValue){
            ((UITextField*)view).text = [NSString stringWithFormat:@"%@",reactiveNumber.number];
        }];
    }
    else if ([view isKindOfClass:[UITextView class]])
    {
        ((UITextView*)view).text = [NSString stringWithFormat:@"%@",reactiveNumber.number];
        [reactiveNumber observeWith:^(id newValue){
            ((UITextView*)view).text = [NSString stringWithFormat:@"%@",reactiveNumber.number];
        }];
    }
    else if ([view isKindOfClass:[UIButton class]])
    {
        [((UIButton*)view) setTitle:[NSString stringWithFormat:@"%@",reactiveNumber.number] forState:UIControlStateNormal];
        [reactiveNumber observeWith:^(id newValue){
            [((UIButton*)view) setTitle:[NSString stringWithFormat:@"%@",reactiveNumber.number] forState:UIControlStateNormal];
        }];
    }
    else if ([view isKindOfClass:[UIStepper class]])
    {
        [((UIStepper*)view) setValue:reactiveNumber.number.doubleValue];
        [reactiveNumber observeWith:^(id newValue){
            [((UIStepper*)view) setValue:reactiveNumber.number.doubleValue];
        }];
    }
    else if ([view isKindOfClass:[UISlider class]])
    {
        [((UISlider*)view) setValue:reactiveNumber.number.doubleValue];
        [reactiveNumber observeWith:^(id newValue){
            [((UISlider*)view) setValue:reactiveNumber.number.doubleValue];
        }];
    }
    else if ([view isKindOfClass:[UISwitch class]])
    {
        [((UISwitch*)view) setOn:reactiveNumber.number.boolValue];
        [reactiveNumber observeWith:^(id newValue){
            [((UISwitch*)view) setOn:reactiveNumber.number.boolValue];
        }];
    }
    else if ([view isKindOfClass:[UIProgressView class]])
    {
        [((UIProgressView*)view) setProgress:reactiveNumber.number.floatValue];
        [reactiveNumber observeWith:^(id newValue){
            [((UIProgressView*)view) setProgress:reactiveNumber.number.floatValue];
        }];
    }
}

-(void)bindReactiveArray:(WDReactiveMutableArray*)reactiveArray to:(UIView*)view
{
    [reactiveArray observeWith:^(id newValue){
        if ([view isKindOfClass:[UITableView class]])
        {
            [(UITableView*)view reloadData];
        }
    }];
}

-(void)bindReactiveUserDefaults:(WDReactiveUserDefaults*)reactiveUserDefaults to:(UIView*)view
{
    id reactiveUserDefaultsValue = [reactiveUserDefaults userDefaultsValue];
    if ([reactiveUserDefaultsValue isKindOfClass:[NSString class]])
    {
        NSString* stringFromUserDefaults =(NSString*)reactiveUserDefaultsValue;
        if ([view isKindOfClass:[UILabel class]])
        {
            ((UILabel*)view).text = stringFromUserDefaults;
            [reactiveUserDefaults observeWith:^(id newValue){
                if ([[reactiveUserDefaults userDefaultsValue] isKindOfClass:[NSString class]])
                {
                    ((UILabel*)view).text = (NSString*)[reactiveUserDefaults userDefaultsValue];
                }
                
            }];
        }
        else if ([view isKindOfClass:[UITextField class]])
        {
            ((UITextField*)view).text = stringFromUserDefaults;
            [reactiveUserDefaults observeWith:^(id newValue){
                if ([[reactiveUserDefaults userDefaultsValue] isKindOfClass:[NSString class]])
                {
                    ((UITextField*)view).text = (NSString*)[reactiveUserDefaults userDefaultsValue];
                }
            }];
        }
        else if ([view isKindOfClass:[UITextView class]])
        {
            ((UITextView*)view).text = stringFromUserDefaults;
            [reactiveUserDefaults observeWith:^(id newValue){
                if ([[reactiveUserDefaults userDefaultsValue] isKindOfClass:[NSString class]])
                {
                    ((UITextView*)view).text = (NSString*)[reactiveUserDefaults userDefaultsValue];
                }
            }];
        }
        else if ([view isKindOfClass:[UIButton class]])
        {
            [((UIButton*)view) setTitle:stringFromUserDefaults forState:UIControlStateNormal];
            [reactiveUserDefaults observeWith:^(id newValue){
                if ([[reactiveUserDefaults userDefaultsValue] isKindOfClass:[NSString class]])
                {
                    [((UIButton*)view) setTitle:(NSString*)[reactiveUserDefaults userDefaultsValue] forState:UIControlStateNormal];
                }
            }];
        }
    }
    else if ([reactiveUserDefaultsValue isKindOfClass:[NSNumber class]])
    {
        NSNumber* numberFromUserDefaults =(NSNumber*)reactiveUserDefaultsValue;
        if ([view isKindOfClass:[UILabel class]])
        {
            ((UILabel*)view).text = [NSString stringWithFormat:@"%@",numberFromUserDefaults];
            [reactiveUserDefaults observeWith:^(id newValue){
                if ([[reactiveUserDefaults userDefaultsValue] isKindOfClass:[NSNumber class]])
                {
                    ((UILabel*)view).text = [NSString stringWithFormat:@"%@",(NSNumber*)[reactiveUserDefaults userDefaultsValue]];
                }
            }];
        }
        else if ([view isKindOfClass:[UITextField class]])
        {
            ((UITextField*)view).text = [NSString stringWithFormat:@"%@",numberFromUserDefaults];
            [reactiveUserDefaults observeWith:^(id newValue){
                if ([[reactiveUserDefaults userDefaultsValue] isKindOfClass:[NSNumber class]])
                {
                    ((UITextField*)view).text = [NSString stringWithFormat:@"%@",(NSNumber*)[reactiveUserDefaults userDefaultsValue]];
                }
            }];
        }
        else if ([view isKindOfClass:[UITextView class]])
        {
            ((UITextView*)view).text = [NSString stringWithFormat:@"%@",numberFromUserDefaults];
            [reactiveUserDefaults observeWith:^(id newValue){
                if ([[reactiveUserDefaults userDefaultsValue] isKindOfClass:[NSNumber class]])
                {
                    ((UITextView*)view).text = [NSString stringWithFormat:@"%@",(NSNumber*)[reactiveUserDefaults userDefaultsValue]];
                }
            }];
        }
        else if ([view isKindOfClass:[UIButton class]])
        {
            [((UIButton*)view) setTitle:[NSString stringWithFormat:@"%@",numberFromUserDefaults] forState:UIControlStateNormal];
            [reactiveUserDefaults observeWith:^(id newValue){
                if ([[reactiveUserDefaults userDefaultsValue] isKindOfClass:[NSNumber class]])
                {
                    [((UIButton*)view) setTitle:[NSString stringWithFormat:@"%@",(NSNumber*)[reactiveUserDefaults userDefaultsValue]] forState:UIControlStateNormal];
                }
            }];
        }
        else if ([view isKindOfClass:[UIStepper class]])
        {
            [((UIStepper*)view) setValue:numberFromUserDefaults.doubleValue];
            [reactiveUserDefaults observeWith:^(id newValue){
                if ([[reactiveUserDefaults userDefaultsValue] isKindOfClass:[NSNumber class]])
                {
                    [((UIStepper*)view) setValue:((NSNumber*)[reactiveUserDefaults userDefaultsValue]).doubleValue];
                }
            }];
        }
        else if ([view isKindOfClass:[UISlider class]])
        {
            [((UISlider*)view) setValue:numberFromUserDefaults.doubleValue];
            [reactiveUserDefaults observeWith:^(id newValue){
                if ([[reactiveUserDefaults userDefaultsValue] isKindOfClass:[NSNumber class]])
                {
                    [((UISlider*)view) setValue:((NSNumber*)[reactiveUserDefaults userDefaultsValue]).doubleValue];
                }
            }];
        }
        else if ([view isKindOfClass:[UISwitch class]])
        {
            [((UISwitch*)view) setOn:numberFromUserDefaults.boolValue];
            [reactiveUserDefaults observeWith:^(id newValue){
                if ([[reactiveUserDefaults userDefaultsValue] isKindOfClass:[NSNumber class]])
                {
                    [((UISwitch*)view) setOn:((NSNumber*)[reactiveUserDefaults userDefaultsValue]).boolValue];
                }
            }];
        }
        else if ([view isKindOfClass:[UIProgressView class]])
        {
            [((UIProgressView*)view) setProgress:numberFromUserDefaults.floatValue];
            [reactiveUserDefaults observeWith:^(id newValue){
                if ([[reactiveUserDefaults userDefaultsValue] isKindOfClass:[NSNumber class]])
                {
                    [((UIProgressView*)view) setProgress:((NSNumber*)[reactiveUserDefaults userDefaultsValue]).floatValue];
                }
            }];
        }
    }
}

@end
