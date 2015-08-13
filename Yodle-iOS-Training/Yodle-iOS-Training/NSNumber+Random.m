//
//  NSNumber+Random.m
//  ServiceTask
//
//  Created by Martin Rybak on 9/4/14.
//  Copyright (c) 2014 ServiceTask. All rights reserved.
//

#import "NSNumber+Random.h"

@implementation NSNumber (Random)

//Generates a random number in the range given (inclusive)
+ (int32_t)randomIntegerBetween:(int32_t)from and:(int32_t)to
{
	int random = arc4random_uniform(to - from + 1) + from;
	return random;
}

@end