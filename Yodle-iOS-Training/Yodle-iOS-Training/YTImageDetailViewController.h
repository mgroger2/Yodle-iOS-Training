//
//  YTImageDetailViewController.h
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTLoremIpsum.h"
#import "YTMurrayDetailDelegate.h"

@interface YTImageDetailViewController : UIViewController

@property (weak, nonatomic) id<YTMurrayDetailDelegate> delegate;
@property (strong, nonatomic) YTLoremIpsum* loremIpsum;
@property (strong, nonatomic) NSIndexPath* indexPath;

@end
