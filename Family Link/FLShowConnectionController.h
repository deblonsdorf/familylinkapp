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
    IBOutlet UITextField *mobile_field1;
    IBOutlet UITextField *email_address1;
    IBOutlet UITextField *address_line1;
    IBOutlet UITextField *address_line2;
    IBOutlet UITextField *address_line3;
    IBOutlet UITextField *birthday1;
    IBOutlet UITextField *anniversary1;
    IBOutlet UITextField *other1;

}

-(IBAction)homeClicked:(id)sender;

@property(nonatomic, strong) NSDictionary* connection;
@end
