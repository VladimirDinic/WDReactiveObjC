//
//  ReactiveString.h
//  WDReactiveObjC
//
//  Created by Vladimir Dinic on 7/23/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDReactiveNSObject.h"

@interface WDReactiveString : WDReactiveNSObject

@property (retain, nonatomic) NSString* text;
-(id)initWith:(NSString*)text;

@end
