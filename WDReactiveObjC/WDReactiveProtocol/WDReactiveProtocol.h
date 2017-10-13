//
//  WDReactiveProtocol.h
//  WDReactiveObjC
//
//  Created by Vladimir Dinic on 9/24/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CompletionBlock)(id newValue);

@protocol WDReactiveProtocol <NSObject>

@optional
@property (retain, nonatomic) id updatedValue;
@property (retain, nonatomic) NSArray<NSString*>* keyPaths;
@property NSMutableArray<CompletionBlock>* completions;
-(void)observeWith:(CompletionBlock)completion;
-(void)stopObserving;
-(void)performCompletions;

@end

