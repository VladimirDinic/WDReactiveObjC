//
//  WDReactiveObjC.h
//  WDReactiveObjC
//
//  Created by Vladimir Dinic on 7/23/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDReactiveNSObject.h"
#import "WDReactiveNumber.h"
#import "WDReactiveString.h"
#import "WDReactiveMutableArray.h"
#import "WDReactiveUserDefaults.h"

@interface WDReactiveObjC : NSObject

+ (instancetype)sharedInstance;

-(void)bind:(WDReactiveNSObject*)reactiveObject to:(UIView*)view;

@end
