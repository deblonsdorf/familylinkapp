//
//  FLPickController.m
//  Family Link
//
//  Created by BRIAN LONSDORF on 4/19/14.
//  Copyright (c) 2014 LocalCultureMarketing. All rights reserved.
//

#import "FLPickController.h"
#import "Family.h"
#import "FLConnectionsController.h"

@interface FLPickController ()

@end

@implementation FLPickController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.tableHeaderView = self.customHeaderView;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    families = [Family all];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSMutableDictionary* family;
    NSIndexPath *selectedRowIndexPath = [self.tableView indexPathForSelectedRow];
    family = families[selectedRowIndexPath.row];
    if([segue.destinationViewController respondsToSelector:@selector(setFamily:)]){
        [segue.destinationViewController setFamily: family];
    }

    [segue.destinationViewController setTitle: [family valueForKey:@"name"]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [families count];
}

-(UIView *) customHeaderView {
    if (!customHeaderView) {
        customHeaderView = [[NSBundle mainBundle] loadNibNamed:@"Header1" owner:self options:nil][0];
    }
    
    return customHeaderView;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"enterfamilyname";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSInteger i = indexPath.row;
    
    if(cell) {
        
        if ([families count] != 0) {
            UILabel* tf = (UILabel*)[cell viewWithTag:2];
            tf.text =  [families[i] objectForKey:@"name"];
        }
        
    } else {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    

    
    return cell;
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSUInteger row = [indexPath row];
    NSUInteger count = [families count];
    
    if (row < count) {
        return UITableViewCellEditingStyleDelete;
    } else {
        return UITableViewCellEditingStyleNone;
    }
    
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSUInteger row = [indexPath row];
    NSUInteger count = [families count];
    
    if (row < count) {
        [families removeObjectAtIndex:row];
        [self.tableView reloadData];
    }
    
}

- (void)tableView:(UITableView *)tableView
didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView reloadData];
}

@end
