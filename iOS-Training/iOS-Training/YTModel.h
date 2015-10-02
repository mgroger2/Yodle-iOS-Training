//
//  YTModel.h
//  iOS-Training
//
//  Created by Mark Rogers on 10/1/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YTModel : NSObject

@property (strong, nonatomic) UIImage* image;
@property (copy, nonatomic) NSString* header;
@property (copy, nonatomic) NSString* body;

@end
