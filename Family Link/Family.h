//
//  Family.h
//  Family Link
//
//  Created by BRIAN LONSDORF on 5/4/14.
//  Copyright (c) 2014 LocalCultureMarketing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Family : NSObject

+(NSMutableArray*)all;
+(void)addFamily:(NSString *)name;
+(void)addConnection:(NSMutableDictionary *)con forFamily:(NSDictionary *)fam;
@end
