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
	NSArray* array = [successString componentsSeparatedByString: @"\n\n"];
	
	YTModel* model = [[self alloc] init];
	model.header = [array firstObject];
	model.body = [array lastObject];
	
	
	return model;
}

@end
