//
//  MyTableViewCell.h
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTLoremIpsum.h"

@interface MyTableViewCell : UITableViewCell

- (void)configureDataStructure:(YTLoremIpsum*)dataStructure;

@end
