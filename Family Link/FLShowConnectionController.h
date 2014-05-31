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
    IBOutlet UILabel *mobile_field1;
    IBOutlet UILabel *email_address1;
    IBOutlet UILabel *address_line1;
    IBOutlet UILabel *address_line2;
    IBOutlet UILabel *address_line3;
    IBOutlet UILabel *birthday1;
    IBOutlet UILabel *anniversary1;
    IBOutlet UILabel *other1;
    IBOutlet UIScrollView *scrollview;
}

-(IBAction)homeClicked:(id)sender;

@property(nonatomic, strong) NSDictionary* connection;
@end
