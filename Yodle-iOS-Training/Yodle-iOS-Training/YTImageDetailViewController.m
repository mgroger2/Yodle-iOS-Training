//
//  YTImageDetailViewController.m
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import "YTImageDetailViewController.h"

@interface YTImageDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView* imageDetail;
@property (weak, nonatomic) IBOutlet UILabel* titleLabel;
@property (weak, nonatomic) IBOutlet UILabel* descriptionLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* imageWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* imageHeightConstraint;
@property (weak, nonatomic) IBOutlet UITextField* titleTextField;
@property (weak, nonatomic) IBOutlet UIButton* titleButton;

@end

typedef NS_ENUM(NSUInteger, YTImageDetailViewControllerTitleButtonMode) {
	YTImageDetailViewControllerTitleButtonModeEdit,
	YTImageDetailViewControllerTitleButtonModeSave
};

@implementation YTImageDetailViewController

- (void)viewDidLoad
{
	[self changeImage:self.loremIpsum.image];
	self.titleLabel.text = self.loremIpsum.text[@"title"];
	self.descriptionLabel.text = self.loremIpsum.text[@"body"];
	self.titleButton.tag = YTImageDetailViewControllerTitleButtonModeEdit;
	
}

- (void)changeImage:(UIImage*)image
{
	self.imageDetail.image = image;
	self.imageWidthConstraint.constant = image.size.width;
	self.imageHeightConstraint.constant = image.size.height;
}

- (IBAction)titleButtonPressed:(UIButton*)sender
{
	switch (sender.tag) {
		case YTImageDetailViewControllerTitleButtonModeEdit:
			[self styleTitleButton:YTImageDetailViewControllerTitleButtonModeSave];
			break;
		case YTImageDetailViewControllerTitleButtonModeSave:
			[self styleTitleButton:YTImageDetailViewControllerTitleButtonModeEdit];
			[self.delegate didChangeDetail:self.loremIpsum];
			break;
	}
}

- (void)styleTitleButton:(YTImageDetailViewControllerTitleButtonMode)mode
{
	switch (mode) {
		case YTImageDetailViewControllerTitleButtonModeEdit:
			self.titleButton.tag = YTImageDetailViewControllerTitleButtonModeEdit;
			self.titleButton.backgroundColor = [UIColor cyanColor];
			[self.titleButton setTitle:@"Edit" forState:UIControlStateNormal];
			self.titleTextField.hidden = YES;
			self.titleLabel.hidden = NO;
			break;
		case YTImageDetailViewControllerTitleButtonModeSave:
			self.titleButton.tag = YTImageDetailViewControllerTitleButtonModeSave;
			self.titleButton.backgroundColor = [UIColor greenColor];
			[self.titleButton setTitle:@"Save" forState:UIControlStateNormal];
			self.titleTextField.hidden = YES;
			self.titleLabel.hidden = NO;
			break;
	}
	
	self.titleButton.titleLabel.textColor = [UIColor whiteColor];
	self.titleLabel.text = self.loremIpsum.text[@"title"];
}

@end
