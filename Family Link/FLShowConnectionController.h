//
//  FLShowConnectionController.h
//  Family Link
//
//  Created by BRIAN LONSDORF on 5/24/14.
//  Copyright (c) 2014 LocalCultureMarketing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLShowConnectionController : UIViewController
{
    IBOutlet UILabel* name;
    IBOutlet UIScrollView *scrollview;
}

@property(nonatomic, strong) NSDictionary* connection;
@end
