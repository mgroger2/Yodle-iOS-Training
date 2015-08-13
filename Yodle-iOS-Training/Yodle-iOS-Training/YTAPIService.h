//
//  YTNetworkService.h
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTLoremIpsum.h"

@interface YTAPIService : NSObject

- (UIImage*)fetchImage;
- (UIImage*)fetchLoremImageFullSize;
- (NSDictionary*)fetchLoremIpsumText;

@end
