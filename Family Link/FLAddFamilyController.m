//
//  FLAddFamilyController.m
//  Family Link
//
//  Created by BRIAN LONSDORF on 5/4/14.
//  Copyright (c) 2014 LocalCultureMarketing. All rights reserved.
//

#import "FLAddFamilyController.h"
#import "Family.h"

@interface FLAddFamilyController ()

@end

@implementation FLAddFamilyController


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
        [Family addFamily:textField.text];
    }

    [self dismissViewControllerAnimated:YES completion:nil];
    return YES;
}

-(IBAction)homeClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
