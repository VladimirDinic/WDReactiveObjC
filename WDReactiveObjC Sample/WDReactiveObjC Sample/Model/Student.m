//
//  Student.m
//  WDReactiveObjC
//
//  Created by Vladimir Dinic on 9/24/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

#import "Student.h"

@implementation Student

-(id)iniWithFirstName:(NSString*)firstName lastName:(NSString*)lastName andAge:(int)age
{
    if (self == [super init])
    {
        self.firstName = [[WDReactiveString alloc] initWith:firstName];
        self.lastName = [[WDReactiveString alloc] initWith:lastName];;
        self.age = [[WDReactiveNumber alloc] initWith:@(age)];
    }
    return self;
}

@end
