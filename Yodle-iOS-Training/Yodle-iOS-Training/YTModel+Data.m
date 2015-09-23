//
//  YTModel+Data.m
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 9/23/15.
//  Copyright © 2015 Mark Rogers. All rights reserved.
//

#import "YTModel+Data.h"
#import "NSNumber+Random.h"

@implementation YTModel (Data)

+ (instancetype)modelWithData:(NSData*)data
{
	NSString* successString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	successString = [successString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	NSArray<NSString*>* array = [successString componentsSeparatedByString: @"\n\n"];
	
	YTModel* model = [[self alloc] init];
	model.header = [array firstObject];
	model.body = [array lastObject];
	
	
	return model;
}

- (NSURL*)randomImageURL;//ForWidth:(CGFloat)maxWidth
{
//	NSUInteger minimumSize = 20;
//	NSUInteger maximumHeight = 400;
	
	int width = [NSNumber randomIntegerBetween:20 and:200];
	int height = [NSNumber randomIntegerBetween:20 and:400];
	
	NSString* imageAPI = [NSString stringWithFormat:@"%@%d/%d", self.imageURL.description, width, height];
	
	return [NSURL URLWithString:imageAPI];
}

@end
