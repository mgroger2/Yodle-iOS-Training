//
//  YTModelCell.m
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import "YTModelCell.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "YTModel+Data.h"

@interface YTModelCell ()

@end

@implementation YTModelCell

- (void)configureWithModel:(YTModel*)model
{
	self.model = model;
	self.headerLabel.text = model.header;
	self.bodyLabel.text = model.body;
	
	[self.thumbnail setImageWithURL:self.model.imageURL usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
}

@end
