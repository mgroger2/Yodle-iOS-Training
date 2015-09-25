//
//  YTMainTableViewController.m
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import "YTMainTableViewController.h"
#import "YTCell.h"
#import "YTAPIService.h"
#import "YTImageDetailViewController.h"

const NSUInteger YTMainTableViewControllerRowCount = 5;

@interface YTMainTableViewController ()

@property (strong, nonatomic) YTAPIService* apiService;
@property (strong, nonatomic) NSArray<YTModel*>* models;

@end

@implementation YTMainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.apiService = [[YTAPIService alloc] init];
	
	[self.apiService fetchModelObjectsWithCount:YTMainTableViewControllerRowCount success:^(NSArray<YTModel*>* models) {
		self.models = models;
		[self.tableView reloadData];
	}];
}

- (void)viewWillAppear:(BOOL)animated
{
	[self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
	//TODO: Spinner
    return self.models.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    YTCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MyReuse" forIndexPath:indexPath];
	
	[cell configureWithModel:self.models[indexPath.row]];
	
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"CellDetailSegue"]) {
		YTImageDetailViewController* destination = segue.destinationViewController;
		destination.model = ((YTCell*)sender).model;
		destination.modelImage = ((YTCell*)sender).thumbnail.image;
	}
}

@end
