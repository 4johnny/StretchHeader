//
//  MasterViewController.m
//  StretchHeader
//
//  Created by Johnny on 2015-02-17.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "StretchHeaderTableViewCell.h"
#import "NewsItem.h"


#
# pragma mark - Interface
#


@interface MasterViewController ()

#
# pragma mark Properties
#

@property (nonatomic) NSMutableArray* newsItems;

@end


#
# pragma mark - Implementation
#


@implementation MasterViewController


static const int kTableHeaderHeight = 350; // points


#
# pragma mark NSObject(UINibLoadingAdditions)
#


- (void)awakeFromNib {
	[super awakeFromNib];
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
	    self.clearsSelectionOnViewWillAppear = NO;
	    self.preferredContentSize = CGSizeMake(320.0, 600.0);
	}
}


#
# pragma mark UIViewController
#


- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.navigationItem.leftBarButtonItem = self.editButtonItem;

//	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//	self.navigationItem.rightBarButtonItem = addButton;
//	self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];

	
	// Load data model
	self.newsItems = [NSMutableArray arrayWithArray:[self loadModel]];
	
	// Size table rows to fit content
	self.tableView.rowHeight = UITableViewAutomaticDimension;
	
	// Hide navigation bar
	self.navigationController.navigationBar.hidden = YES;

	// Hide status bar
	[UIApplication sharedApplication].statusBarHidden = YES;

	// Put today's date in header
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	dateFormatter.dateFormat = @"MMMM d";
	self.dateLabel.text = [dateFormatter stringFromDate:[NSDate date]];
	
	// Load header programmatically, since table view manages frame of its table header
	self.tableView.tableHeaderView = nil;
	[self.tableView addSubview:self.headerView];
	self.tableView.contentInset = UIEdgeInsetsMake(kTableHeaderHeight, 0, 0, 0);
	self.tableView.contentOffset = CGPointMake(0, -kTableHeaderHeight);
	[self updateHeaderView];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


//- (BOOL)prefersStatusBarHidden {
//	
//	[self setNeedsStatusBarAppearanceUpdate];
//	return YES;
//}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	
	if ([[segue identifier] isEqualToString:@"showDetail"]) {
		
//	    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//		
//	    NSDate *object = self.newsItems[indexPath.row];
		
	    DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
//	    [controller setDetailItem:object];

	    controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
	    controller.navigationItem.leftItemsSupplementBackButton = YES;
	}
}


#
# pragma mark <UITableViewDataSource>
#


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return self.newsItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	StretchHeaderTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"stretchHeaderTableViewCell" forIndexPath:indexPath];

	NewsItem* newsItem = self.newsItems[indexPath.item];
	
	cell.categoryLabel.text = [NewsItem stringForCategory:newsItem.category];
	cell.categoryLabel.textColor = [NewsItem colorForCategory:newsItem.category];
	cell.headlineLabel.text = newsItem.headline;

	//	switch (arc4random_uniform(4)) {
	//
	//		case 0:
	//			cell.categoryLabel.text = @"World";
	//			cell.headlineLabel.text = @"asdfkj as asjdhf as ash ak as kf hsa klsa  asjk as  sa jklsa jkd ash as d jads j XXX";
	//			break;
	//
	//		case 1:
	//			cell.categoryLabel.text = @"Europe";
	//			cell.headlineLabel.text = @"asdfkj as asjdhf as ash ak as kf hsa klsa  asjk as  sa jklsa jkd ash as d jads j  jkdf lkas sa dfh asd  sadfjkl asdfh kasd fjjkasd asfj asdfj alsdf XXX";
	//			break;
	//
	//		case 2:
	//			cell.categoryLabel.text = @"Middle East";
	//			cell.headlineLabel.text = @"asdfkj as asjdhf as ash ak as kf hsa klsa  asjk as  sa jklsa jkd ash as d jads j XXX";
	//			break;
	//
	//		default:
	//			cell.categoryLabel.text = @"Americas";
	//			cell.headlineLabel.text = @"asdfkj as asjdhf as ash ak as kf hsa klsa  asjk as  sa jklsa jkd ash as d jads j sad l jlas jsad sa k sa  jas jkdf lkas sa dfh asd  sadfjkl asdfh kasd fjjkasd asfj asdfj alsdf asdfkj as asjdhf as ash ak as kf hsa klsa  asjk as  sa jklsa jkd ash as d jads j sad l jlas jsad sa k sa  jas jkdf lkas sa dfh asd  sadfjkl asdfh kasd fjjkasd asfj asdfj alsdf XXX";
	//			break;
	//	}

	return cell;
}


//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//	
//	// Return NO if you do not want the specified item to be editable.
//	return YES;
//}


//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//	
//	if (editingStyle == UITableViewCellEditingStyleDelete) {
//		
//	    [self.newsItems removeObjectAtIndex:indexPath.row];
//	    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//		
//	} else if (editingStyle == UITableViewCellEditingStyleInsert) {
//		
//	    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//	}
//}


#
# pragma mark <UITableViewDelegate>
#


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	return UITableViewAutomaticDimension;
}


#
# pragma mark <UIScrollViewDelegate>
#


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	
	[self updateHeaderView];
}


#
# pragma mark Helpers
#

#
//- (void)insertNewObject:(id)sender {
//	
//	if (!self.newsItems) {
//		self.newsItems = [[NSMutableArray alloc] init];
//	}
//	[self.newsItems insertObject:[NSDate date] atIndex:0];
//	
//	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//	[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//}


- (NSArray*)loadModel {

	return
	@[[NewsItem newsItemWithCategory:Category_World andHeadline:@"Climate change protests, divestments meet fossil fuels realities"],
	  [NewsItem newsItemWithCategory:Category_Europe andHeadline:@"Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"],
	  [NewsItem newsItemWithCategory:Category_MiddleEast andHeadline:@"Airstrikes boost Islamic State, FBI director warns more hostages possible"],
	  [NewsItem newsItemWithCategory:Category_Africa andHeadline:@"Nigeria says 70 dead in building collapse; questions S. Africa victim claim"],
	  [NewsItem newsItemWithCategory:Category_AsiaPacific andHeadline:@"Despite UN ruling, Japan seeks backing for whale hunting"],
	  [NewsItem newsItemWithCategory:Category_Americas andHeadline:@"Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"],
	  [NewsItem newsItemWithCategory:Category_World andHeadline:@"South Africa in $40 billion deal for Russian nuclear reactors"],
	  [NewsItem newsItemWithCategory:Category_Europe andHeadline:@"'One million babies' created by EU student exchanges"]
	  ];
}


- (void)updateHeaderView {
	
	CGFloat headerFrameWidth = self.tableView.bounds.size.width;
	CGFloat headerFrameHeight = MAX(kTableHeaderHeight, -self.tableView.contentOffset.y);

	self.headerView.frame = CGRectMake(0, -headerFrameHeight, headerFrameWidth, headerFrameHeight);
}


@end
