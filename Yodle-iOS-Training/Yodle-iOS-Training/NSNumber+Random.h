//
//  NSNumber+Random.h
//  ServiceTask
//
//  Created by Martin Rybak on 9/4/14.
//  Copyright (c) 2014 ServiceTask. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Random)

+ (int32_t)randomIntegerBetween:(int32_t)from and:(int32_t)to;

@end
