//
//  YTNetworkService.m
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import "YTAPIService.h"

NSString* const YTAPIServiceImageBaseUrl = @"http://www.fillmurray.com/";
NSString* const YTAPIServiceLoremIpsumTextBaseUrl = @"http://loripsum.net/api/1/short/headers/plaintext";

@interface YTAPIService ()

@end

@implementation YTAPIService

- (void)fetchImageWithSize:(CGSize)size completion:(void(^)(UIImage*))completion
{
	NSString* imageAPI = [NSString stringWithFormat:@"%@/%.0f/%.0f", YTAPIServiceImageBaseUrl, size.width, size.height];
	
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
				NSArray* successArray = [successString componentsSeparatedByString: @"\n\n"];
				NSDictionary* successDictionary = @{
				  @"title":successArray[0],
				  @"body":successArray[1]
				};
				completion(successDictionary);
			}
		});
	});
}

@end
