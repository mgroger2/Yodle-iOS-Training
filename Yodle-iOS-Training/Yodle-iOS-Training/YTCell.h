//
//  YTCell.h
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTLoremIpsum.h"

@interface YTCell : UITableViewCell

@property (strong, nonatomic) YTLoremIpsum* loremIpsum;

- (void)initialSetup;
- (void)configureLoremIpsumText:(NSDictionary*)dictionary;

@end
