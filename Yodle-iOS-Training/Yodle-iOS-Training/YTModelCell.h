//
//  YTModelCell.h
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTModel.h"

@interface YTModelCell : UITableViewCell

@property (strong, nonatomic) YTModel* model;
@property (weak, nonatomic) IBOutlet UIImageView* thumbnail;
@property (weak, nonatomic) IBOutlet UILabel* headerLabel;
@property (weak, nonatomic) IBOutlet UILabel* bodyLabel;

- (void)configureWithModel:(YTModel*)model;

@end
