//
//  YTNetworkService.h
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTLoremIpsum.h"
#import "YTCell.h"

@interface YTAPIService : NSObject

- (void)fetchImageWithMaxSize:(CGSize)size cell:(YTCell*)cell;
- (void)fetchLoremIpsumTextForCell:(YTCell*)cell;

@end
