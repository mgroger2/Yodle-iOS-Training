//
//  YTMainTableViewController.m
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import "YTMainTableViewController.h"
#import "YTCell.h"

@interface YTMainTableViewController ()

@end

@implementation YTMainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    YTCell* cell = [tableView dequeueReusableCellWithIdentifier:[YTCell description] forIndexPath:indexPath];
	
	
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
	
}

@end
