//
//  YTImageDetailViewController.h
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTModel.h"
#import "YTImageDetailViewControllerDelegate.h"

@interface YTImageDetailViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) YTModel* model;
@property (weak, nonatomic) id<YTImageDetailViewControllerDelegate> delegate;

@end
