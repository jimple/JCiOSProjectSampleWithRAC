//
//  UIScrollView+JCLoadMoreIndicator.m
//  UzysCircularProgressPullToRefresh
//
//  Created by jimple on 14-5-9.
//  Copyright (c) 2014年 jimple. All rights reserved.
//

#import "UIScrollView+JCLoadMoreIndicator.h"
#import <objc/runtime.h>


static char UIScrollViewLoadMoreView;


@implementation UIScrollView (JCLoadMoreIndicator)
@dynamic loadMoreView;

- (void)addLoadMoreActionHandler:(actionLoadMoreHandler)handler
{
    if(!self.loadMoreView)
    {
        JCLoadMoreActivityIndicator *view = [[JCLoadMoreActivityIndicator alloc] init];
        view.scrollView = self;
        view.frame = CGRectMake((self.bounds.size.width - view.bounds.size.width)/2,
                                self.bounds.size.height, view.bounds.size.width, view.bounds.size.height);
//        view.originalTopInset = self.contentInset.top;
        view.originalBottomInset = self.contentInset.bottom;
        self.loadMoreView = view;
        [self addSubview:view];
        [self sendSubviewToBack:view];
    }else{}
    
    self.loadMoreView.loadMoreHandler = handler;
}

- (void)triggerLoadMoreIndicator
{
    [self.loadMoreView manuallyTriggered];
}

- (void)stopLoadMoreIndicator
{
    [self.loadMoreView stopIndicatorAnimation];
}

- (BOOL)isLoading
{
    return [self.loadMoreView isLoading];
}

- (void)showNoMoreTips:(NSString *)tips
{
    [self.loadMoreView showNoMoreTips:tips];
}

- (void)clearNoMoreTips
{
    [self showNoMoreTips:@""];
}

#pragma mark -
- (void)setLoadMoreView:(JCLoadMoreActivityIndicator *)loadMoreView
{
    [self willChangeValueForKey:@"JCLoadMoreActivityIndicator"];
    objc_setAssociatedObject(self, &UIScrollViewLoadMoreView, loadMoreView, OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"JCLoadMoreActivityIndicator"];
}

- (JCLoadMoreActivityIndicator *)loadMoreView
{
    return objc_getAssociatedObject(self, &UIScrollViewLoadMoreView);
}












@end
