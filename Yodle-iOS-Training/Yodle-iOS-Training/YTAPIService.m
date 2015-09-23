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
NSString* const YTAPIServiceLoremIpsumTextBaseUrl = @"http://loripsum.net/api/1/short/headers/plaintext";
NSUInteger const YTAPIServiceMinimumImageSize = 20;

@interface YTAPIService ()

@end

@implementation YTAPIService

- (void)fetchModelObjectsWithCount:(NSUInteger)count success:(void(^)(NSArray<YTModel*>*))success
{
	NSMutableArray* array = [[NSMutableArray alloc] initWithCapacity:count];
	NSOperationQueue* currentQueue = [NSOperationQueue currentQueue];
	
	[[[NSOperationQueue alloc] init] addOperationWithBlock:^{
		for (int i=0; i<count; i++) {
			NSURL* textURL = [NSURL URLWithString:YTAPIServiceLoremIpsumTextBaseUrl];
			NSData *textData = [NSData dataWithContentsOfURL:textURL];
			
			YTModel* model = [YTModel modelWithData:textData];
			model.imageURL = [NSURL URLWithString:YTAPIServiceImageBaseUrl];
			[array addObject:model];
		}
		
		[currentQueue addOperationWithBlock:^{
			if (success) {
				success([array copy]);
			}
		}];
	}];
	
}

@end
