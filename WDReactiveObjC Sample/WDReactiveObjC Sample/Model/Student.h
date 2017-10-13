//
//  Student.h
//  WDReactiveObjC
//
//  Created by Vladimir Dinic on 9/24/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDReactiveProtocol.h"
#import "WDReactiveNumber.h"
#import "WDReactiveString.h"

@interface Student : NSObject <WDReactiveProtocol>

@property (retain, nonatomic) WDReactiveString* firstName;
@property (retain, nonatomic) WDReactiveString* lastName;
@property WDReactiveNumber* age;

-(id)iniWithFirstName:(NSString*)firstName lastName:(NSString*)lastName andAge:(int)age;

@end
