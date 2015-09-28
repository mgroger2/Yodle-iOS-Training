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
#import "YTModel+Data.h"

NSString* const YTAPIServiceImageBaseUrl = @"http://www.fillmurray.com/";
NSString* const YTAPIServiceLoremIpsumTextBaseUrl = @"http://www.filltext.com/?rows=%lu&header=%%7Blorem%%7C%lu%%7D&body=%%7Blorem%%7C%lu%%7D";
NSUInteger const YTAPIServiceMinimumImageSize = 20;
NSUInteger const YTAPIServiceHeaderWordCount = 5;
NSUInteger const YTAPIServiceBodyWordCount = 50;

@interface YTAPIService ()

@end

@implementation YTAPIService

- (void)fetchModelObjectsWithCount:(NSUInteger)count success:(void(^)(NSArray<YTModel*>*))success
{
	NSMutableArray* arrayOfModels = [[NSMutableArray alloc] initWithCapacity:count];
	NSOperationQueue* currentQueue = [NSOperationQueue currentQueue];
	
	[[[NSOperationQueue alloc] init] addOperationWithBlock:^{
		NSString* urlString = [NSString stringWithFormat:YTAPIServiceLoremIpsumTextBaseUrl, (unsigned long)count, (unsigned long)YTAPIServiceHeaderWordCount, (unsigned long)YTAPIServiceBodyWordCount];
		NSURL* textURL = [NSURL URLWithString:urlString];
		NSData *textData = [NSData dataWithContentsOfURL:textURL];
		
		if (!textData) {
			NSLog(@"Failed to download text.");
			return;
		}
		
		NSArray* arrayOfDictionaries = [NSJSONSerialization JSONObjectWithData:textData options:0 error:nil];
		
		for (int i = 0; i < arrayOfDictionaries.count; i++) {
			YTModel* model = [[YTModel alloc] init];
			model.header = (arrayOfDictionaries[i])[@"header"];
			model.body = (arrayOfDictionaries[i])[@"body"];
			model.imageURL = [self randomImageURL];
			[arrayOfModels addObject:model];
		}
		
		[currentQueue addOperationWithBlock:^{
			if (success) {
				success([arrayOfModels copy]);
			}
		}];
	}];
}

- (NSArray<NSDictionary*>*)arrayFromData:(NSData*)data
{
	NSMutableArray* arrayOfDictionaries = [[NSMutableArray alloc] init];
	
	//TODO
	
	return arrayOfDictionaries;
}

- (NSURL*)randomImageURL;//ForWidth:(CGFloat)maxWidth
{
	//	NSUInteger minimumSize = 20;
	//	NSUInteger maximumHeight = 400;
	
	int width = [NSNumber randomIntegerBetween:20 and:200];
	int height = [NSNumber randomIntegerBetween:20 and:400];
	
	NSString* imageAPI = [NSString stringWithFormat:@"%@%d/%d", YTAPIServiceImageBaseUrl, width, height];
	
	return [NSURL URLWithString:imageAPI];
}

@end
