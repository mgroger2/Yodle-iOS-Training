//
//  YTLoremIpsumService.m
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import "YTLoremIpsumService.h"
#import "YTAPIService.h"

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
	
	loremIpsum.image = [self.apiService fetchImage];
	
	NSDictionary* loremText = [self.apiService fetchLoremIpsumText];
	loremIpsum.title = loremText[@"title"];
	loremIpsum.title = loremText[@"body"];
	
	return loremIpsum;
}

@end
