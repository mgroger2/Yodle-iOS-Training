//
//  YTModelCell.m
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import "YTModelCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "YTModel+Data.h"

@interface YTModelCell ()

@property (assign, nonatomic) BOOL hasImage;

@end

@implementation YTModelCell

- (void)configureWithModel:(YTModel*)model
{
	self.model = model;
	self.headerLabel.text = model.header;
	self.bodyLabel.text = model.body;
	
	if (!self.hasImage) {
		[self.thumbnail sd_setImageWithURL:[model randomImageURL] placeholderImage:[UIImage imageNamed:@"Char Floating Head.jpg"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
			self.hasImage = YES;
		}];
	}
}

@end
