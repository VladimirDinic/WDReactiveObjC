//
//  ReactiveMutableArray.m
//  WDReactiveObjC
//
//  Created by Vladimir Dinic on 7/29/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

#import "WDReactiveMutableArray.h"

@implementation WDReactiveMutableArray

-(id)initWith:(NSMutableArray<WDReactiveProtocol>*)array
{
    if (self = [super init])
    {
        internalArray = array;
    }
    return self;
}
    
-(NSUInteger)count
{
    return [internalArray count];
}
    
-(NSObject<WDReactiveProtocol>*)objectAtIndex:(int)index
{
    return [internalArray objectAtIndex:index];
}

-(void)edit:(void (^)(NSMutableArray<WDReactiveProtocol>*))editArrayBlock
{
    editArrayBlock(internalArray);
    [self performCompletions];
}
    
@end
