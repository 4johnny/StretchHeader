//
//  MasterViewController.h
//  StretchHeader
//
//  Created by Johnny on 2015-02-17.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

#
# pragma mark - Interface
#

@interface MasterViewController : UITableViewController <UIScrollViewDelegate>

#
# pragma mark Properties
#

@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

