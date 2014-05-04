//
//  FLLoginController.m
//  Family Link
//
//  Created by BRIAN LONSDORF on 4/19/14.
//  Copyright (c) 2014 LocalCultureMarketing. All rights reserved.
//

#import "FLLoginController.h"
#import "FLPickController.h"

#define kOFFSET_FOR_KEYBOARD 230.0

@interface FLLoginController ()

@end

@implementation FLLoginController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    email.delegate = self;
    password.delegate = self;

    [[self.navigationController navigationBar] setBarTintColor:[UIColor purpleColor]];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

-(void)dismissKeyboard
{
    [email resignFirstResponder];
    [password resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField == password) {
        [self performSegueWithIdentifier:@"loggedin" sender:self];
        return YES;
    } else {
        [password becomeFirstResponder];
    }
    
    return YES;
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if([identifier isEqualToString:@"loggedin"] && ![password isFirstResponder]) {
        return NO;
    }
    return YES;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [email resignFirstResponder];
    [password resignFirstResponder];
}

-(void)keyboardWillShow {
    // Animate the current view out of the way
    
    if (!keyboardShowed)
    {
        keyboardShowed = YES;
        
        [self setViewMovedUp:YES];
        
        
    }
    
}

-(void)keyboardWillHide {
    if (keyboardShowed)
    {
        keyboardShowed = NO;
        
        [self setViewMovedUp:NO];
        
    }
}


//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;

    if (movedUp)
    {
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += 100;
    }
    else
    {
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= 100;
    }

    self.view.frame = rect;
    
    [UIView commitAnimations];
}




- (void)viewWillDisappear:(BOOL)animated
{
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}


@end
