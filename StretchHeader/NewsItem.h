//
//  NewsItem.h
//  StretchHeader
//
//  Created by Johnny on 2015-02-17.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, Category) {
	
	Category_None = 0,
	
	Category_World,
	Category_Americas,
	Category_Europe,
	Category_MiddleEast,
	Category_Africa,
	Category_AsiaPacific
};


@interface NewsItem : NSObject

@property (nonatomic) Category category;
@property (nonatomic) NSString* headline;

+ (instancetype)newsItemWithCategory:(Category)category andHeadline:(NSString*)headline;

+ (NSString*)stringForCategory:(Category)category;
+ (UIColor*)colorForCategory:(Category)category;

@end
