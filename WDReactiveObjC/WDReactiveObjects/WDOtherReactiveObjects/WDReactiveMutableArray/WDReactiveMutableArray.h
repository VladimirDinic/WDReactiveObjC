//
//  ReactiveMutableArray.h
//  WDReactiveObjC
//
//  Created by Vladimir Dinic on 7/29/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDReactiveNSObject.h"

@interface WDReactiveMutableArray<WDReactiveProtocol> : WDReactiveNSObject
{
    NSMutableArray<WDReactiveProtocol>* internalArray;
}

-(id)initWith:(NSMutableArray<WDReactiveProtocol>*)array;
-(NSUInteger)count;
-(id)objectAtIndex:(int)index;
-(void)edit:(void (^)(NSMutableArray<WDReactiveProtocol>*))editArrayBlock;
    
@end
