//
//  ReactiveNumber.h
//  WDReactiveObjC
//
//  Created by Vladimir Dinic on 7/25/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDReactiveNSObject.h"

@interface WDReactiveNumber : WDReactiveNSObject

@property (retain, nonatomic) NSNumber* number;
-(id)initWith:(NSNumber*)number;

@end
