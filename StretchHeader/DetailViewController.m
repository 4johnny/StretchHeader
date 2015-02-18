//
//  DetailViewController.m
//  StretchHeader
//
//  Created by Johnny on 2015-02-17.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "DetailViewController.h"


#
# pragma mark - Interface
#


@interface DetailViewController ()

@end


#
# pragma mark - Implementation
#


@implementation DetailViewController


#
# pragma mark Property Accessors
#


- (void)setDetailItem:(id)newDetailItem {
	if (_detailItem != newDetailItem) {
	    _detailItem = newDetailItem;
	        
	    // Update the view.
	    [self configureView];
	}
}


#
# pragma mark UIViewController
#


- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self configureView];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


#
# pragma mark Helpers
#


- (void)configureView {
	// Update the user interface for the detail item.
	if (self.detailItem) {
		self.detailDescriptionLabel.text = [self.detailItem description];
	}
}


@end
