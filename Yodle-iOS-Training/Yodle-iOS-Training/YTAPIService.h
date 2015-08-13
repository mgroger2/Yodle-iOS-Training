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

- (void)fetchImageWithSize:(CGSize)size completion:(void(^)(UIImage*))completion;
- (void)fetchLoremIpsumTextWithCompletion:(void(^)(NSDictionary*))completion;

@end
