//
//  YTImageDetailViewController.h
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTModel.h"

@interface YTImageDetailViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) YTModel* model;
@property (strong, nonatomic) UIImage* modelImage;

@end
