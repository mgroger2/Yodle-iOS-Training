//
//  YTLoremIpsum.m
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import "YTLoremIpsum.h"

NSUInteger const YTLoremIpsumFullImageWidth = 80;
NSUInteger const YTLoremIpsumFullImageHeight = 80;
NSUInteger const YTLoremIpsumThumbnailWidth = 80;
NSUInteger const YTLoremIpsumThumbnailHeight = 80;

@implementation YTLoremIpsum

+ (CGSize)imageSize
{
	return CGSizeMake(YTLoremIpsumFullImageWidth, YTLoremIpsumFullImageHeight);
}

- (UIImage*)thumbnail
{
	CGSize destinationSize = CGSizeMake(YTLoremIpsumThumbnailWidth, YTLoremIpsumThumbnailHeight);
	
	UIGraphicsBeginImageContext(destinationSize);
	[self.image drawInRect:CGRectMake(0, 0, destinationSize.width, destinationSize.height)];
	UIImage* thumbnail = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return thumbnail;
}

- (void)setImage:(UIImage *)image
{
	_image = image;
	[_delegate loremIpsumImageDidFinishDownloading];
}

- (void)setText:(NSDictionary *)text
{
	_text = text;
	[_delegate loremIpsumTextDidFinishDownloading];
}

@end
