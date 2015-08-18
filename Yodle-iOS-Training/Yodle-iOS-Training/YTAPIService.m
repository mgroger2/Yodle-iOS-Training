//
//  YTNetworkService.m
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import "YTAPIService.h"
#import "NSNumber+Random.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <AFNetworking/AFNetworking.h>

NSString* const YTAPIServiceImageBaseUrl = @"http://www.fillmurray.com/";
NSString* const YTAPIServiceLoremIpsumTextBaseUrl = @"http://loripsum.net/api/1/short/headers/plaintext";
NSUInteger const YTAPIServiceMinimumImageSize = 20;

@interface YTAPIService ()

@end

@implementation YTAPIService

- (void)fetchImageWithMaxSize:(CGSize)size cell:(YTCell*)cell
{
	CGSize randomSize = [self getRandomSizeWithMaxSize:size];
	NSString* imageAPI = [NSString stringWithFormat:@"%@/%.0f/%.0f", YTAPIServiceImageBaseUrl, randomSize.width, randomSize.height];
	
	[cell.imageView sd_setImageWithURL:[NSURL URLWithString:imageAPI] placeholderImage:[UIImage imageNamed:@"Char Yawning.jpg"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
		cell.loremIpsum.image = image;
	}];
}

- (void)fetchLoremIpsumTextForCell:(YTCell*)cell
{
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSURL* textURL = [NSURL URLWithString:YTAPIServiceLoremIpsumTextBaseUrl];
		NSData *textData = [NSData dataWithContentsOfURL:textURL];
		
		//This is the completion handler
		dispatch_sync(dispatch_get_main_queue(), ^{
			[cell configureLoremIpsumText:[self dictionaryForTextResponse:textData]];
		});
	});
}

#pragma mark - Private

- (CGSize)getRandomSizeWithMaxSize:(CGSize)maxSize
{
	NSNumber* width = [[NSNumber alloc] initWithInteger:[NSNumber randomIntegerBetween:YTAPIServiceMinimumImageSize and:maxSize.width]];
	NSNumber* height = [[NSNumber alloc] initWithInteger:[NSNumber randomIntegerBetween:YTAPIServiceMinimumImageSize and:maxSize.height]];
	
	return CGSizeMake([width integerValue], [height integerValue]);
}

- (NSDictionary*)dictionaryForTextResponse:(NSData*)responseData
{
	NSString* successString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
	successString = [successString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	NSArray* successArray = [successString componentsSeparatedByString: @"\n\n"];
	NSDictionary* successDictionary = @{
		@"title":[successArray firstObject],
		@"body":[successArray lastObject]
	};
	
	return successDictionary;
}

@end
