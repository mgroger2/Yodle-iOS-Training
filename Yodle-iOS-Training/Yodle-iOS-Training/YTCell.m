//
//  YTCell.m
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import "YTCell.h"

@interface YTCell ()

@property (weak, nonatomic) IBOutlet UIImageView* thumbnail;
@property (weak, nonatomic) IBOutlet UILabel* titleLabel;
@property (weak, nonatomic) IBOutlet UILabel* descriptionLabel;

@end

@implementation YTCell

- (instancetype)init
{
	if (self = [super init]) {
		_loremIpsum = [[YTLoremIpsum alloc] init];
	}
	return self;
}

- (void)configureIsLoading
{
	self.thumbnail.image = [UIImage imageNamed:@"loadingImage.png"];
	self.titleLabel.text = @"Loading...";
	self.descriptionLabel.text = @"";
}

- (void)loremIpsumImageDidFinishDownloading
{
	self.thumbnail.image = self.loremIpsum.thumbnail;
}

- (void)loremIpsumTextDidFinishDownloading
{
	self.titleLabel.text = self.loremIpsum.text[@"title"];
	self.descriptionLabel.text = self.loremIpsum.text[@"body"];
}

@end
