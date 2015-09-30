//
//  YTModelCell.m
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import "YTModelCell.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"

@interface YTModelCell ()

@end

@implementation YTModelCell

- (void)awakeFromNib
{
	self.thumbnail.layer.borderColor = [UIColor lightGrayColor].CGColor;
	self.thumbnail.layer.borderWidth = 0.5;
	self.thumbnail.contentMode = UIViewContentModeScaleAspectFit;
	self.thumbnail.clipsToBounds = YES;
}

- (void)configureWithModel:(YTModel*)model
{
	self.model = model;
	self.headerLabel.text = model.header;
	self.bodyLabel.text = model.body;
	
	[self.thumbnail setImageWithURL:self.model.imageURL completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL){
		self.model.image = image;
	} usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
}

@end
