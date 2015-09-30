//
//  YTNetworkService.h
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTModel.h"

@interface YTAPIService : NSObject

- (void)fetchModelObjectsWithCount:(NSUInteger)count success:(void(^)(NSArray*))success;

@end
