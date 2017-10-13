//
//  ReactiveType.m
//  WDReactiveObjC
//
//  Created by Vladimir Dinic on 7/25/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

#import "WDReactiveNSObject.h"

@implementation WDReactiveNSObject

@synthesize updatedValue;

@synthesize completions;

@synthesize keyPaths;


-(id)initWith:(NSString*)text
{
    if (self = [super init])
    {
        
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
    if (self.keyPaths != NULL)
    {
        for (NSString* singleKeyPath in self.keyPaths)
        {
            [self addObserver:self forKeyPath:singleKeyPath options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
        }
    }
}

-(void)stopObserving
{
    for (NSString* singleKeyPath in self.keyPaths)
    {
        [self removeObserver:self forKeyPath:singleKeyPath];
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([self.keyPaths containsObject:keyPath])
    {
        id oldC = [change objectForKey:NSKeyValueChangeOldKey];
        self.updatedValue = [change objectForKey:NSKeyValueChangeNewKey];
        
        NSLog(@"%@ %@", oldC, self.updatedValue);
        [self performCompletions];
    }
}
    
-(void)performCompletions
{
    for (CompletionBlock completion in self.completions)
    {
        completion(self.updatedValue);
    }
}

@end
