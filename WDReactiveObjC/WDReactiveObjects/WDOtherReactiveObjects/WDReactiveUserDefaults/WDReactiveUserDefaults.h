//
//  WDReactiveUserDefaults.h
//  WDReactiveObjC Sample
//
//  Created by Vladimir Dinic on 9/24/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

#import "WDReactiveNSObject.h"

@interface WDReactiveUserDefaults : WDReactiveNSObject

@property (retain, nonatomic) NSString* userDefaultsName;

-(id)userDefaultsValue;
-(id)initWithUserDefaultsName:(NSString*)userDefaultsName;

@end
