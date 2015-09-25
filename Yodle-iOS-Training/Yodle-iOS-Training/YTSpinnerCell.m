//
//  YTSpinnerCell.m
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 9/25/15.
//  Copyright © 2015 Mark Rogers. All rights reserved.
//

#import "YTSpinnerCell.h"

@implementation YTSpinnerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		[self setup];
	}
	return self;
}

- (void)setup
{
	self.separatorInset = UIEdgeInsetsMake(0, 0, 0, CGFLOAT_MAX);
}

@end
