//
//  FLConnectionsController.h
//  Family Link
//
//  Created by BRIAN LONSDORF on 5/24/14.
//  Copyright (c) 2014 LocalCultureMarketing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLConnectionsController : UITableViewController
{
    NSMutableArray *connections;
}

@property(nonatomic, strong) NSDictionary* family;

@end
