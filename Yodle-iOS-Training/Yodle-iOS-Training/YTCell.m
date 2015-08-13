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

- (void)configureDataStructure:(YTLoremIpsum*)dataStructure
{
	self.thumbnail.image = dataStructure.image;
	self.titleLabel.text = dataStructure.title;
	self.descriptionLabel.text = dataStructure.body;
}

@end
