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

@end

@implementation YTImageDetailViewController

- (void)configureLoremIpsum:(YTLoremIpsum*)loremIpsum
{
	self.imageDetail.image = loremIpsum.image;
	self.titleLabel.text = loremIpsum.text[@"title"];
	self.descriptionLabel.text = loremIpsum.text[@"body"];
}

@end
