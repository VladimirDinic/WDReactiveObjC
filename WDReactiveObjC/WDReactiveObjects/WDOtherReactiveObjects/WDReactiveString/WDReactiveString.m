//
//  ReactiveString.m
//  WDReactiveObjC
//
//  Created by Vladimir Dinic on 7/23/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

#import "WDReactiveString.h"

@implementation WDReactiveString

-(id)initWith:(NSString*)text
{
    if (self = [super init])
    {
        self.keyPaths = @[@"text"];
        self.text = text;
    }
    return self;
}

@end
