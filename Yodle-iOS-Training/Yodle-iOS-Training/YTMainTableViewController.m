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

@interface YTMainTableViewController ()

@property (strong, nonatomic) YTAPIService* apiService;

@end

@implementation YTMainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.apiService = [[YTAPIService alloc] init];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    YTCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MyReuse" forIndexPath:indexPath];
	
	if (!cell.loremIpsum) {
		[cell initialSetup];
		
		[self.apiService fetchImageWithSize:[YTLoremIpsum imageSize] completion:^(UIImage* image) {
			cell.loremIpsum.image = image;
		}];
		
		[self.apiService fetchLoremIpsumTextWithCompletion:^(NSDictionary* dictionary) {
			cell.loremIpsum.text = dictionary;
		}];
	}
	
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"CellDetailSegue"]) {
		YTImageDetailViewController* destination = segue.destinationViewController;
		[destination configureLoremIpsum:((YTCell*)sender).loremIpsum];
	}
}

@end
