//
//  YTImageDetailViewController.m
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import "YTImageDetailViewController.h"

@interface YTImageDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView* imageDetail;
@property (weak, nonatomic) IBOutlet UILabel* titleLabel;
@property (weak, nonatomic) IBOutlet UILabel* descriptionLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* imageWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* imageHeightConstraint;

@end

@implementation YTImageDetailViewController

- (void)viewDidLoad
{
	[self changeImage:self.loremIpsum.image];
	self.titleLabel.text = self.loremIpsum.text[@"title"];
	self.descriptionLabel.text = self.loremIpsum.text[@"body"];
}

- (void)changeImage:(UIImage*)image
{
	self.imageDetail.image = image;
	self.imageWidthConstraint.constant = image.size.width;
	self.imageHeightConstraint.constant = image.size.height;
}

@end
