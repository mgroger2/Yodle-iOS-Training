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

NSUInteger const YTMainTableViewControllerFetchAmount = 5;
NSUInteger const YTMainTableViewControllerDataSection = 0;
NSUInteger const YTMainTableViewControllerSpinnerSection = 1;
NSString* const YTMainTableViewControllerDataReuse = @"MyReuse";
NSString* const YTMainTableViewControllerSpinnerReuse = @"Spinner";
NSString* const YTMainTableViewControllerDetailSegue = @"CellDetailSegue";

@interface YTMainTableViewController ()

@property (strong, nonatomic) YTAPIService* apiService;
@property (strong, nonatomic) NSMutableArray<YTModel*>* models;

@end

@implementation YTMainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.apiService = [[YTAPIService alloc] init];
	self.models = [NSMutableArray array];
	
	[self fetchMoreModels];
}

#pragma mark - Private

- (void)fetchMoreModels
{
	[self.apiService fetchModelObjectsWithCount:YTMainTableViewControllerFetchAmount success:^(NSArray<YTModel*>* models) {
		NSUInteger originalCount = self.models.count;
		[self.models addObjectsFromArray:models];
		
		NSMutableArray* indexPaths = [NSMutableArray array];
		for (int i = 0 ; i < models.count; i++) {
			[indexPaths addObject:[NSIndexPath indexPathForRow:originalCount + i inSection:0]];
		}

		[self.tableView beginUpdates];
		[self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
		[self.tableView endUpdates];
	}];
}

#pragma mark - YTImageDetailViewControllerDelegate

- (void)reloadCellForModel:(YTModel *)model
{
	NSIndexPath* indexPathForModel = [NSIndexPath indexPathForRow:[self.models indexOfObject:model] inSection:0];
	[self.tableView reloadRowsAtIndexPaths:@[ indexPathForModel ] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
	if (section == YTMainTableViewControllerDataSection) {
		return self.models.count;
	}
	return 1;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
	if (indexPath.section == YTMainTableViewControllerDataSection) {
		YTModelCell* cell = [tableView dequeueReusableCellWithIdentifier:YTMainTableViewControllerDataReuse forIndexPath:indexPath];
		
		[cell configureWithModel:self.models[indexPath.row]];
		
		return cell;
	} else {
		YTSpinnerCell* cell = [tableView dequeueReusableCellWithIdentifier:YTMainTableViewControllerSpinnerReuse forIndexPath:indexPath];
		
		[cell.spinner startAnimating];
		
		return cell;
	}
}

- (void)tableView:(UITableView*)tableView willDisplayCell:(UITableViewCell*)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
	if ([cell isKindOfClass:[YTSpinnerCell class]]) {
		[self fetchMoreModels];
	}
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:YTMainTableViewControllerDetailSegue]) {
		YTImageDetailViewController* destination = segue.destinationViewController;
		destination.model = ((YTModelCell*)sender).model;
		destination.delegate = self;
	}
}

@end
