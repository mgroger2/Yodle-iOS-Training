//
//  YTCell.m
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import "YTCell.h"

@interface YTCell ()

@property (weak, nonatomic) IBOutlet UILabel* titleLabel;
@property (weak, nonatomic) IBOutlet UILabel* descriptionLabel;

@end

@implementation YTCell

- (void)initialSetup
{
	_loremIpsum = [[YTLoremIpsum alloc] init];
	
	self.titleLabel.text = @"Loading...";
	self.descriptionLabel.text = @"";
}

- (void)configureLoremIpsumText:(NSDictionary *)dictionary
{
	self.titleLabel.text = dictionary[@"title"];
	self.descriptionLabel.text = dictionary[@"body"];
	
	self.loremIpsum.text = dictionary;
}

@end
