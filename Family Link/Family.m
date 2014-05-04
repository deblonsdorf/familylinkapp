//
//  Family.m
//  Family Link
//
//  Created by BRIAN LONSDORF on 5/4/14.
//  Copyright (c) 2014 LocalCultureMarketing. All rights reserved.
//

#import "Family.h"

@implementation Family

static NSMutableArray *_fams;

+(NSDictionary*)_makeFam:(NSString*)n
{
    return [NSDictionary dictionaryWithObjectsAndKeys:n,@"name", [[NSMutableArray alloc] init], @"connections", nil];
}

+(NSMutableArray*)fams
{
    if(!_fams) {
        _fams = [NSMutableArray arrayWithObjects:[Family _makeFam:@"Lonsdorf"], [Family _makeFam:@"Smith"], [Family _makeFam:@"Buck"], [Family _makeFam: @"Logan"], [Family _makeFam:@"Jones"], nil];
    }
    
    return _fams;
}

+(NSMutableArray*)all
{

    return [Family fams];

}

+(void)addFamily:(NSString *)name
{
    [[Family fams] addObject:[Family _makeFam:name]];
}

@end
