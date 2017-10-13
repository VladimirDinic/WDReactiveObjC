//
//  WDReactiveUserDefaults.m
//  WDReactiveObjC Sample
//
//  Created by Vladimir Dinic on 9/24/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

#import "WDReactiveUserDefaults.h"

@implementation WDReactiveUserDefaults

-(id)initWithUserDefaultsName:(NSString*)userDefaultsName
{
    if (self = [super init])
    {
        self.userDefaultsName = userDefaultsName;
        
    }
    return self;
}

-(void)observeWith:(CompletionBlock)completion
{
    if (self.completions == NULL)
    {
        self.completions = [NSMutableArray<CompletionBlock> new];
    }
    [self.completions addObject:completion];
    [[NSUserDefaults standardUserDefaults] addObserver:self forKeyPath:self.userDefaultsName options:NSKeyValueObservingOptionNew context:NULL];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([object isKindOfClass:[NSUserDefaults class]])
    {
        [self performCompletions];
    }
}

-(id)userDefaultsValue
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:self.userDefaultsName];
}

@end
