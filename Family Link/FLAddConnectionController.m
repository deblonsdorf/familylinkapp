//
//  FLAddConnectionController.m
//  Family Link
//
//  Created by BRIAN LONSDORF on 5/24/14.
//  Copyright (c) 2014 LocalCultureMarketing. All rights reserved.
//

#import "FLAddConnectionController.h"
#import "Family.h"

@interface FLAddConnectionController ()

@end

@implementation FLAddConnectionController
@synthesize family = _family;

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
    // Do any additional setup after loading the view.
    name_field.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField.text.length > 1) {
        NSMutableDictionary* d = [NSMutableDictionary dictionaryWithObjectsAndKeys:textField.text, @"name", nil];
        [Family addConnection:d forFamily:_family];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    return YES;
}

-(IBAction)closeClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
