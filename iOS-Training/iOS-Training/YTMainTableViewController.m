//
//  YTMainTableViewController.m
//  iOS-Training
//
//  Created by Mark Rogers on 10/1/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import "YTMainTableViewController.h"
#import "YTModelCell.h"

NSString* const YTMainTableViewControllerModelCellReuse = @"MyReuse";

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YTModelCell* cell = [tableView dequeueReusableCellWithIdentifier:YTMainTableViewControllerModelCellReuse forIndexPath:indexPath];
    
	
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
