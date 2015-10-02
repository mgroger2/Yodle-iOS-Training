//
//  YTModelCell.m
//  iOS-Training
//
//  Created by Mark Rogers on 10/1/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import "YTModelCell.h"

@implementation YTModelCell

- (void)awakeFromNib
{
	
}

- (void)configureWithModel:(YTModel*)model
{
	self.model = model;
	self.titleLabel.text = model.header;
	self.bodyLabel.text = model.body;
}

@end
