//
//  YTCell.m
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import "YTCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "YTModel+Data.h"

@implementation YTCell

- (void)configureWithModel:(YTModel*)model
{
	self.model = model;
	self.headerLabel.text = model.header;
	self.bodyLabel.text = model.body;
	
	[self.thumbnail sd_setImageWithURL:[model randomImageURL] placeholderImage:[UIImage imageNamed:@"Char Floating Head.jpg"]];
}

@end
