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
@property (weak, nonatomic) IBOutlet UIView* titleDisplayView;
@property (weak, nonatomic) IBOutlet UIButton* titleEditButton;
@property (weak, nonatomic) IBOutlet UILabel* titleLabel;
@property (weak, nonatomic) IBOutlet UIView* titleEditView;
@property (weak, nonatomic) IBOutlet UIButton* titleSaveButton;
@property (weak, nonatomic) IBOutlet UITextField* titleEditTextield;
@property (weak, nonatomic) IBOutlet UILabel* descriptionLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* bodyLabelWidth;

@end

typedef NS_ENUM(NSUInteger, YTImageDetailViewControllerMode) {
	YTImageDetailViewControllerEditingMode,
	YTImageDetailViewControllerDisplayingMode
};

@implementation YTImageDetailViewController

- (void)viewDidLoad
{
	self.titleLabel.text = self.model.header;
	self.descriptionLabel.text = self.model.body;
	self.imageDetail.image = self.model.image;
	self.titleEditTextield.delegate = self;
	self.titleEditView.hidden = YES;
	self.titleDisplayView.hidden = NO;
}

- (void)viewWillAppear:(BOOL)animated
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

- (IBAction)titleSaveButtonPressed:(UIButton*)sender
{
	[self setTitle:self.titleEditTextield.text];
	
	self.titleEditView.hidden = YES;
	self.titleDisplayView.hidden = NO;
}

- (IBAction)titleEditButtonPressed:(UIButton*)sender
{
	self.titleEditTextield.text = self.titleLabel.text;
	
	self.titleEditView.hidden = NO;
	self.titleDisplayView.hidden = YES;
}

- (void)setTitle:(NSString*)newTitle
{
	self.model.header = newTitle;
	self.titleLabel.text = newTitle;
	
	[self.delegate modelDidChange:self.model];
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
