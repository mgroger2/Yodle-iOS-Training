//
//  YTImageDetailViewControllerDelegate.h
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 9/28/15.
//  Copyright © 2015 Mark Rogers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import	"YTModel.h"

@protocol YTImageDetailViewControllerDelegate <NSObject>

- (void)modelDidChange:(YTModel*)model;

@end
