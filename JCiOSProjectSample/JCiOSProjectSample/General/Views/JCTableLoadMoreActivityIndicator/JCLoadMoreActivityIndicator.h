//
//  JCLoadMoreActivityIndicator.h
//  UzysCircularProgressPullToRefresh
//
//  Created by jimple on 14-5-9.
//  Copyright (c) 2014年 jimple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^actionLoadMoreHandler)(void);


@interface JCLoadMoreActivityIndicator : UIView
@property (nonatomic,copy) actionLoadMoreHandler loadMoreHandler;
@property (nonatomic,assign) CGFloat originalBottomInset;
@property (nonatomic,weak) UIScrollView *scrollView;
@property (nonatomic, assign) BOOL isLoading;


- (void)stopIndicatorAnimation;
- (void)manuallyTriggered;
- (void)showNoMoreTips:(NSString *)tips;



@end
