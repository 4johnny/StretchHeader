//
//  NewsItem.m
//  StretchHeader
//
//  Created by Johnny on 2015-02-17.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "NewsItem.h"

@implementation NewsItem


+ (instancetype)newsItemWithCategory:(Category)category andHeadline:(NSString*)headline {

	return [[NewsItem alloc] initWithCategory:category andHeadline:headline];
}


- (instancetype)initWithCategory:(Category)category andHeadline:(NSString*)headline {
	
	self = [super init];
	if (self) {
		
		_category = category;
		_headline = headline;
	}
	
	return self;
}


- (instancetype)init {
	
	return [self initWithCategory:Category_None andHeadline:nil];
}


+ (NSString*)stringForCategory:(Category)category {

	switch (category) {
			
		case Category_World:
			return @"World";
		
		case Category_Americas:
			return @"Americas";
			
		case Category_Europe:
			return @"Europe";
			
		case Category_MiddleEast:
			return @"Middle East";
			
		case Category_Africa:
			return @"Africa";
			
		case Category_AsiaPacific:
			return @"Asia Pacific";
			
		case Category_None:
		default:
			return nil;
	}
}


+ (UIColor*)colorForCategory:(Category)category {
	
	switch (category) {
			
		case Category_World:
			return [UIColor greenColor];
			
		case Category_Americas:
			return [UIColor blueColor];
			
		case Category_Europe:
			return [UIColor magentaColor];
			
		case Category_MiddleEast:
			return [UIColor purpleColor];
			
		case Category_Africa:
			return [UIColor redColor];
			
		case Category_AsiaPacific:
			return [UIColor orangeColor];
			
		case Category_None:
		default:
			return nil;
	}
}


@end
