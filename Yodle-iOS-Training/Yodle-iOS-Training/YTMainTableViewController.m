//
//  YTMainTableViewController.m
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import "YTMainTableViewController.h"
#import "YTModelCell.h"
#import "YTAPIService.h"
#import "YTImageDetailViewController.h"
#import "YTSpinnerCell.h"

const NSUInteger YTMainTableViewControllerFetchAmount = 5;

@interface YTMainTableViewController ()

@property (strong, nonatomic) YTAPIService* apiService;
@property (strong, nonatomic) NSArray<YTModel*>* models;

@end

@implementation YTMainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.apiService = [[YTAPIService alloc] init];
	self.models = [[NSArray alloc] init];
	
	[self fetchMoreModels];
}

- (void)viewWillAppear:(BOOL)animated
{
	[self.tableView reloadData];
}

#pragma mark -

- (void)fetchMoreModels
{
	[self.apiService fetchModelObjectsWithCount:YTMainTableViewControllerFetchAmount success:^(NSArray<YTModel*>* models) {
		NSMutableArray* tempModels = [NSMutableArray arrayWithArray:self.models];
		[tempModels addObjectsFromArray:models];
		self.models = [tempModels copy];
		[self.tableView reloadData];
	}];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
	if (section == 0) {
		return self.models.count;
	}
	return 1;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
	if (indexPath.section == 0) {
		YTModelCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MyReuse" forIndexPath:indexPath];
		
		[cell configureWithModel:self.models[indexPath.row]];
		
		return cell;
	} else {
		YTSpinnerCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Spinner" forIndexPath:indexPath];
		
		[cell.spinner startAnimating];
		
		return cell;
	}
}

- (void)tableView:(UITableView*)tableView willDisplayCell:(UITableViewCell*)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
	if (![cell isKindOfClass:[YTSpinnerCell class]]) {
		return;
	}
	
	[self fetchMoreModels];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"CellDetailSegue"]) {
		YTImageDetailViewController* destination = segue.destinationViewController;
		destination.model = ((YTModelCell*)sender).model;
		destination.modelImage = ((YTModelCell*)sender).thumbnail.image;
	}
}

@end
