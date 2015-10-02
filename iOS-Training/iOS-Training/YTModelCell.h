//
//  YTModelCell.h
//  iOS-Training
//
//  Created by Mark Rogers on 10/1/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTModel.h"

@interface YTModelCell : UITableViewCell

@property (weak, nonatomic) YTModel* model;
@property (weak, nonatomic) IBOutlet UILabel* titleLabel;
@property (weak, nonatomic) IBOutlet UILabel* bodyLabel;
@property (weak, nonatomic) IBOutlet UIImageView* thumbnail;

- (void)configureWithModel:(YTModel*)model;

@end
