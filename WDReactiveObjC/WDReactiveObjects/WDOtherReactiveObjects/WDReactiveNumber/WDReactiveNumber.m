//
//  ReactiveNumber.m
//  WDReactiveObjC
//
//  Created by Vladimir Dinic on 7/25/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

#import "WDReactiveNumber.h"

@implementation WDReactiveNumber


-(id)initWith:(NSNumber*)number
{
    if (self = [super init])
    {
        self.keyPaths = @[@"number"];
        self.number = number;
    }
    return self;
}

@end
