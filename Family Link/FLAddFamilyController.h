//
//  FLAddFamilyController.h
//  Family Link
//
//  Created by BRIAN LONSDORF on 5/4/14.
//  Copyright (c) 2014 LocalCultureMarketing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLAddFamilyController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UITextField *name_field;
}

-(IBAction)cancelClicked:(id)sender;
-(IBAction)submitClicked:(id)sender;

@end
