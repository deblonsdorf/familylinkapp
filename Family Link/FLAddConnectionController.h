//
//  FLAddConnectionController.h
//  Family Link
//
//  Created by BRIAN LONSDORF on 5/24/14.
//  Copyright (c) 2014 LocalCultureMarketing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLAddConnectionController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UITextField *name_field;
    IBOutlet UITextField *mobile_field;
}

@property(nonatomic, strong) NSDictionary* family;
-(IBAction)closeClicked:(id)sender;
@end
