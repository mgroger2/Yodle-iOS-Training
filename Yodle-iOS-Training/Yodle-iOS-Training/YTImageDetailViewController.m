//
//  YTImageDetailViewController.m
//  Yodle-iOS-Training
//
//  Created by Mark Rogers on 8/13/15.
//  Copyright (c) 2015 Mark Rogers. All rights reserved.
//

#import "YTImageDetailViewController.h"

@interface YTImageDetailViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView* scrollView;
@property (weak, nonatomic) IBOutlet UIImageView* imageDetail;
@property (weak, nonatomic) IBOutlet UILabel* titleLabel;
@property (weak, nonatomic) IBOutlet UILabel* descriptionLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* imageWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* imageHeightConstraint;
@property (weak, nonatomic) IBOutlet UITextField* titleTextField;
@property (weak, nonatomic) IBOutlet UIButton* titleButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* bodyLabelWidth;

@end

typedef NS_ENUM(NSUInteger, YTImageDetailViewControllerMode) {
	YTImageDetailViewControllerEditingMode,
	YTImageDetailViewControllerDisplayingMode
};

@implementation YTImageDetailViewController

- (void)viewDidLoad
{
	[self changeImage:self.loremIpsum.image];
	self.titleLabel.text = self.loremIpsum.text[@"title"];
	self.descriptionLabel.text = self.loremIpsum.text[@"body"];
	[self styleForm:YTImageDetailViewControllerDisplayingMode];
	self.titleTextField.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
	[self formatLabel];
}

- (void)formatLabel
{
	self.bodyLabelWidth.constant = self.view.frame.size.width - 16;
	
	//Calculate the expected size based on the font and linebreak mode of your label
	// FLT_MAX here simply means no constraint in height
	CGSize maximumLabelSize = CGSizeMake(self.bodyLabelWidth.constant, FLT_MAX);
	
	CGSize expectedSize = [self.descriptionLabel sizeThatFits:maximumLabelSize];
	
	//adjust the label the the new height.
	CGRect newFrame = self.descriptionLabel.frame;
	newFrame.size.height = expectedSize.height;
	self.descriptionLabel.frame = newFrame;
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
		case YTImageDetailViewControllerDisplayingMode:
			[self styleForm:YTImageDetailViewControllerEditingMode];
			break;
		case YTImageDetailViewControllerEditingMode:
			[self styleForm:YTImageDetailViewControllerDisplayingMode];
			[self setTitle:self.titleTextField.text];
			break;
	}
}

- (void)styleForm:(YTImageDetailViewControllerMode)mode
{
	[self styleTitleButton:mode];
	[self styleTitleLabel:mode];
	[self styleTitleTextfield:mode];
}

- (void)styleTitleButton:(YTImageDetailViewControllerMode)mode
{
	switch (mode) {
		case YTImageDetailViewControllerDisplayingMode:
			self.titleButton.tag = YTImageDetailViewControllerDisplayingMode;
			self.titleButton.backgroundColor = [UIColor cyanColor];
			[self.titleButton setTitle:@"Edit" forState:UIControlStateNormal];
			break;
		case YTImageDetailViewControllerEditingMode:
			self.titleButton.tag = YTImageDetailViewControllerEditingMode;
			self.titleButton.backgroundColor = [UIColor greenColor];
			[self.titleButton setTitle:@"Save" forState:UIControlStateNormal];
			break;
	}
	
	self.titleButton.titleLabel.textColor = [UIColor whiteColor];
}

- (void)styleTitleTextfield:(YTImageDetailViewControllerMode)mode
{
	switch (mode) {
		case YTImageDetailViewControllerDisplayingMode:
			self.titleTextField.hidden = YES;
			[self setEditing:NO];
			break;
		case YTImageDetailViewControllerEditingMode:
			self.titleTextField.hidden = NO;
			self.titleTextField.text = @"";
			break;
	}
}

- (void)styleTitleLabel:(YTImageDetailViewControllerMode)mode
{
	switch (mode) {
		case YTImageDetailViewControllerDisplayingMode:
			self.titleLabel.hidden = NO;
			break;
		case YTImageDetailViewControllerEditingMode:
			self.titleLabel.hidden = YES;
			break;
	}
}

- (void)setTitle:(NSString*)newTitle
{
	NSDictionary* newDictionary = @{
		@"title":newTitle,
		@"body":self.loremIpsum.text[@"body"]
	};
	
	self.loremIpsum.text = newDictionary;
	self.titleLabel.text = newDictionary[@"title"];
	[self.delegate didChangeDetail:self.loremIpsum];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	UIEdgeInsets insets = self.scrollView.contentInset;
	insets.bottom = 216;
	self.scrollView.contentInset = insets;
	self.scrollView.scrollIndicatorInsets = insets;
}

- (void)textFieldDidEndEditing:(UITextField*)textField
{
	UIEdgeInsets insets = self.scrollView.contentInset;
	insets.bottom = 216;
	self.scrollView.contentInset = insets;
	self.scrollView.scrollIndicatorInsets = insets;
}

@end
