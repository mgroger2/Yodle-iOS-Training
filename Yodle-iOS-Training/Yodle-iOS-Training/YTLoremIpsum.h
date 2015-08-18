//
//  YTLoremIpsum.h
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YTLoremIpsum : NSObject

@property (strong, nonatomic) UIImage* image;
@property (strong, nonatomic) NSDictionary* text;
@property (strong, nonatomic) NSIndexPath* indexPath;

+ (CGSize)maxImageSize;
- (UIImage*)thumbnail;

@end
