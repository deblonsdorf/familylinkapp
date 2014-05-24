//
//  FLConnectionsController.m
//  Family Link
//
//  Created by BRIAN LONSDORF on 5/24/14.
//  Copyright (c) 2014 LocalCultureMarketing. All rights reserved.
//

#import "FLConnectionsController.h"
#import "Family.h"
#import "FLAddConnectionController.h"
#import "FLShowConnectionController.h"

@interface FLConnectionsController ()

@end


@implementation FLConnectionsController

@synthesize family = _family;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([segue.destinationViewController respondsToSelector:@selector(setFamily:)]) {
        [segue.destinationViewController setFamily: _family];
    } else {
        NSIndexPath *selectedRowIndexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *connection = connections[selectedRowIndexPath.row-1];
        [segue.destinationViewController setConnection: connection];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    connections = [_family valueForKey:@"connections"];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [connections count]+1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Individual";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSInteger i = indexPath.row;
    
    
    if(i == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Connections"];
    } else {
        if(cell) {
            
            if ([connections count] != 0) {
                UILabel* tf = (UILabel*)[cell viewWithTag:3];
                tf.text =  [connections[i-1] objectForKey:@"name"];
            }
            
        } else {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
    }
    
    
    
    return cell;
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSUInteger row = [indexPath row];
    NSUInteger count = [connections count];
    
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
    NSUInteger count = [connections count];
    
    if (row < count) {
        [connections removeObjectAtIndex:row-1];
        [self.tableView reloadData];
    }
    
}

- (void)tableView:(UITableView *)tableView
didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView reloadData];
}

@end
