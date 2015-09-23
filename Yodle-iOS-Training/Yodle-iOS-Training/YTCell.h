//
//  YTCell.h
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTLoremIpsum.h"
#import "YTModel.h"

@interface YTCell : UITableViewCell

@property (strong, nonatomic) YTLoremIpsum* loremIpsum;
@property (weak, nonatomic) IBOutlet UIImageView* thumbnail;
@property (weak, nonatomic) IBOutlet UILabel* headerLabel;
@property (weak, nonatomic) IBOutlet UILabel* bodyLabel;

//- (void)initialSetup;
//- (void)configureLoremIpsumText:(NSDictionary*)dictionary;

- (void)configureWithModel:(YTModel*)model;

@end
