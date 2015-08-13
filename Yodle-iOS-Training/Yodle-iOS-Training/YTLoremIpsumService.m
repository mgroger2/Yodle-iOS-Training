//
//  YTLoremIpsumService.m
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import "YTLoremIpsumService.h"
#import "YTAPIService.h"
#import "YTLoremIpsum.h"

@interface YTLoremIpsumService ()

@property (strong, nonatomic) YTAPIService* apiService;

@end

@implementation YTLoremIpsumService

- (instancetype)init
{
	if (self = [super init]) {
		_apiService = [[YTAPIService alloc] init];
	}
	return self;
}

- (YTLoremIpsum*)fetchLoremIpsum
{
	YTLoremIpsum* loremIpsum = [[YTLoremIpsum alloc] init];
	
	[self.apiService fetchImageWithSize:[YTLoremIpsum imageSize] completion:^(UIImage* loremImage) {
		loremIpsum.image = loremImage;
	}];
	
	[self.apiService fetchLoremIpsumTextWithCompletion:^(NSDictionary* loremText) {
		loremIpsum.title = loremText[@"title"];
		loremIpsum.title = loremText[@"body"];
	}];
	
	return loremIpsum;
}

@end
