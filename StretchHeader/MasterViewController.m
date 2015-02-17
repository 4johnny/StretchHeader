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


@interface MasterViewController ()

@property NSMutableArray *objects;

@end


@implementation MasterViewController


- (void)awakeFromNib {
	[super awakeFromNib];
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
	    self.clearsSelectionOnViewWillAppear = NO;
	    self.preferredContentSize = CGSizeMake(320.0, 600.0);
	}
}


- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.navigationItem.leftBarButtonItem = self.editButtonItem;

	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
	self.navigationItem.rightBarButtonItem = addButton;
	self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];

	// Stretch header
	self.tableView.rowHeight = UITableViewAutomaticDimension;
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
	
	if (!self.objects) {
	    self.objects = [[NSMutableArray alloc] init];
	}
	[self.objects insertObject:[NSDate date] atIndex:0];
	
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
	[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Segues


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	
	if ([[segue identifier] isEqualToString:@"showDetail"]) {
		
	    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
	    NSDate *object = self.objects[indexPath.row];
	    DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
	    [controller setDetailItem:object];
	    controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
	    controller.navigationItem.leftItemsSupplementBackButton = YES;
	}
}


#pragma mark - Table View


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	return 1;
}


-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {

	return UITableViewAutomaticDimension;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	StretchHeaderTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"stretchHeaderTableViewCell" forIndexPath:indexPath];

	switch (arc4random_uniform(4)) {
			
		case 0:
			cell.categoryLabel.text = @"World";
			cell.headlineLabel.text = @"asdfkj as asjdhf as ash ak as kf hsa klsa  asjk as  sa jklsa jkd ash as d jads j XXX";
			break;
			
		case 1:
			cell.categoryLabel.text = @"Europe";
			cell.headlineLabel.text = @"asdfkj as asjdhf as ash ak as kf hsa klsa  asjk as  sa jklsa jkd ash as d jads j  jkdf lkas sa dfh asd  sadfjkl asdfh kasd fjjkasd asfj asdfj alsdf XXX";
			break;
			
		case 2:
			cell.categoryLabel.text = @"Middle East";
			cell.headlineLabel.text = @"asdfkj as asjdhf as ash ak as kf hsa klsa  asjk as  sa jklsa jkd ash as d jads j XXX";
			break;
			
		default:
			cell.categoryLabel.text = @"Americas";
			cell.headlineLabel.text = @"asdfkj as asjdhf as ash ak as kf hsa klsa  asjk as  sa jklsa jkd ash as d jads j sad l jlas jsad sa k sa  jas jkdf lkas sa dfh asd  sadfjkl asdfh kasd fjjkasd asfj asdfj alsdf asdfkj as asjdhf as ash ak as kf hsa klsa  asjk as  sa jklsa jkd ash as d jads j sad l jlas jsad sa k sa  jas jkdf lkas sa dfh asd  sadfjkl asdfh kasd fjjkasd asfj asdfj alsdf XXX";
			break;
	}
	
	return cell;
	
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	
	// Return NO if you do not want the specified item to be editable.
	return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		
	    [self.objects removeObjectAtIndex:indexPath.row];
	    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
		
	} else if (editingStyle == UITableViewCellEditingStyleInsert) {
		
	    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
	}
}


@end
