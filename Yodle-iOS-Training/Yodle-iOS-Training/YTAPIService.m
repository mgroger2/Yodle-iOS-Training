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

NSString* const YTAPIServiceImageBaseUrl = @"http://www.fillmurray.com/";
NSString* const YTAPIServiceLoremIpsumTextBaseUrl = @"http://loripsum.net/api/1/short/headers/plaintext";
NSUInteger const YTAPIServiceMinimumImageSize = 20;

@interface YTAPIService ()

@end

@implementation YTAPIService

- (void)fetchImageWithMaxSize:(CGSize)size completion:(void(^)(UIImage*))completion
{
	CGSize randomSize = [self getRandomSizeWithMaxSize:size];
	NSString* imageAPI = [NSString stringWithFormat:@"%@/%.0f/%.0f", YTAPIServiceImageBaseUrl, randomSize.width, randomSize.height];
	
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL* imageURL = [NSURL URLWithString:imageAPI];
        NSData* imageData = [NSData dataWithContentsOfURL:imageURL];
					   
        //This is the completion handler
        dispatch_sync(dispatch_get_main_queue(), ^{
			if (completion) {
				completion([UIImage imageWithData:imageData]);
			}
		});
	});
}

- (void)fetchLoremIpsumTextWithCompletion:(void(^)(NSDictionary*))completion
{
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSURL* textURL = [NSURL URLWithString:YTAPIServiceLoremIpsumTextBaseUrl];
		NSData *textData = [NSData dataWithContentsOfURL:textURL];
		
		//This is the completion handler
		dispatch_sync(dispatch_get_main_queue(), ^{
			if (completion) {
				NSString* successString = [[NSString alloc] initWithData:textData encoding:NSUTF8StringEncoding];
				successString = [successString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
				NSArray* successArray = [successString componentsSeparatedByString: @"\n\n"];
				NSDictionary* successDictionary = @{
				  @"title":[successArray firstObject],
				  @"body":[successArray lastObject]
				};
				completion(successDictionary);
			}
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

@end
