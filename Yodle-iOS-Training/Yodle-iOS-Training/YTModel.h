//
//  YTModel.h
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 9/23/15.
//  Copyright © 2015 Mark Rogers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YTModel : NSObject

@property (strong, nonatomic) NSURL* imageURL;
@property (strong, nonatomic) UIImage* image;
@property (copy, nonatomic) NSString* header;
@property (copy, nonatomic) NSString* body;

@end
