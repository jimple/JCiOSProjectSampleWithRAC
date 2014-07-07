//
//  UIScrollView+JCLoadMoreIndicator.h
//  UzysCircularProgressPullToRefresh
//
//  Created by jimple on 14-5-9.
//  Copyright (c) 2014年 jimple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCLoadMoreActivityIndicator.h"



@interface UIScrollView (JCLoadMoreIndicator)

@property (nonatomic, strong, readonly) JCLoadMoreActivityIndicator *loadMoreView;



- (void)addLoadMoreActionHandler:(actionLoadMoreHandler)handler;
- (void)triggerLoadMoreIndicator;
- (void)stopLoadMoreIndicator;
- (BOOL)isLoading;
- (void)showNoMoreTips:(NSString *)tips;
- (void)clearNoMoreTips;


@end
