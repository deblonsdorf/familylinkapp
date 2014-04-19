//
//  FLLoginController.h
//  Family Link
//
//  Created by BRIAN LONSDORF on 4/19/14.
//  Copyright (c) 2014 LocalCultureMarketing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLLoginController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UITextField *email;
    IBOutlet UITextField *password;
    BOOL keyboardShowed;
}

@end
