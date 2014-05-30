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

+(NSDictionary*)_makeFam:(NSString*)n andConnections:(NSMutableArray*)cs
{
    return [NSDictionary dictionaryWithObjectsAndKeys:n,@"name", cs, @"connections", nil];
}


+(NSMutableArray*)fams
{
    NSMutableDictionary *con1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Brian", @"name", @"650-954-0367", @"mobile", @"brian@looprecur.com", @"email", @"2320 Wooster Ave", @"address1", @"Belmont, CA  94002", @"address2", @"04/22/1982", @"birthday", @"09/04/2013", @"anniversary", nil];
    NSMutableDictionary *con2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Tracy", @"name", nil];
    NSMutableDictionary *con8 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Paul", @"name", nil];
    NSMutableDictionary *con9 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Debbie", @"name", nil];
    NSMutableDictionary *con3 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Taylor", @"name", nil];
    NSMutableDictionary *con4 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Char", @"name", nil];
    NSMutableDictionary *con5 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Jess", @"name", nil];
    NSMutableDictionary *con6 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Jeff", @"name", nil];
    NSMutableDictionary *con7 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Sara", @"name", nil];
    
    if(!_fams) {
        _fams = [NSMutableArray arrayWithObjects:[Family _makeFam:@"Lonsdorf" andConnections:[NSMutableArray arrayWithObjects:con1, con2, con8, con9, nil]],
                                                 [Family _makeFam:@"Smith" andConnections:[NSMutableArray arrayWithObjects:con3, con4, con5, con6, con7, nil]],
                                                 [Family _makeFam:@"Buck" andConnections:[[NSMutableArray alloc] init]],
                                                 [Family _makeFam: @"Logan" andConnections:[[NSMutableArray alloc] init]],
                                                 [Family _makeFam:@"Jones" andConnections:[[NSMutableArray alloc] init]],
                                                 nil];
    }
    
    return _fams;
}

+(NSMutableArray*)all
{

    return [Family fams];

}

+(void)addFamily:(NSString *)name
{
    [[Family fams] addObject:[Family _makeFam:name andConnections:[[NSMutableArray alloc] init]]];
}

+(void)addConnection:(NSMutableDictionary *)con forFamily:(NSDictionary *)fam
{
    [[fam valueForKey:@"connections"] addObject:con];
}

@end
