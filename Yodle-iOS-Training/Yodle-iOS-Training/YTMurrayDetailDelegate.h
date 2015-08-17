//
//  YTMurrayDetailDelegate.h
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/17/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTLoremIpsum.h"

@protocol YTMurrayDetailDelegate <NSObject>

- (void)didChangeDetail:(YTLoremIpsum*)newLoremIpsum;

@end
