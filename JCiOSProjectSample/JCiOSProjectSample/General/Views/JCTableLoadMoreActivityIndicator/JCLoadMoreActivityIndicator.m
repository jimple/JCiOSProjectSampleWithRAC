//
//  JCLoadMoreActivityIndicator.m
//  UzysCircularProgressPullToRefresh
//
//  Created by jimple on 14-5-9.
//  Copyright (c) 2014年 jimple. All rights reserved.
//

#import "JCLoadMoreActivityIndicator.h"

@interface JCLoadMoreActivityIndicator ()

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;  //Loading Indicator
@property (nonatomic, strong) UILabel *noMoreTipsLabel;

@end

@implementation JCLoadMoreActivityIndicator

- (id)init
{
    self = [super initWithFrame:CGRectMake(0, 0, 200, 25)];
    if (self) {
        // Initialization code
        
        _isLoading = NO;
        [self commonInit];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)commonInit
{
    [self resetPos];
    self.backgroundColor = [UIColor clearColor];
    
    //init actitvity indicator
    _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activityIndicatorView.hidesWhenStopped = YES;
    _activityIndicatorView.frame = self.bounds;
    [self addSubview:_activityIndicatorView];
    
    _noMoreTipsLabel = [[UILabel alloc] initWithFrame:self.bounds];
    _noMoreTipsLabel.backgroundColor = [UIColor clearColor];
    _noMoreTipsLabel.textAlignment = NSTextAlignmentCenter;
    _noMoreTipsLabel.textColor = COLOR_TextDarkGray;
    _noMoreTipsLabel.font = [UIFont systemFontOfSize:13.0f];
    [self addSubview:_noMoreTipsLabel];
    
    _noMoreTipsLabel.hidden = YES;
}

- (void)stopIndicatorAnimation
{
    [self.activityIndicatorView stopAnimating];
    [self resetScrollViewContentInset:^{
        _isLoading = NO;
    }];
}

- (void)manuallyTriggered
{
    _noMoreTipsLabel.hidden = YES;
    _isLoading = YES;
    
    [self resetPos];
    [self.activityIndicatorView startAnimating];
    [self setupScrollViewContentInsetForLoadingIndicator:nil];
    if(self.loadMoreHandler)
    {
        self.loadMoreHandler();
    }
}

- (void)showNoMoreTips:(NSString *)tips
{
    if (StringNotEmpty(tips))
    {
        if (_isLoading)
        {
            [self stopIndicatorAnimation];
        }else{}
        
        [self resetPos];
        _noMoreTipsLabel.text = tips;
        _noMoreTipsLabel.hidden = NO;
    }
    else
    {
        _noMoreTipsLabel.text = @"";
        _noMoreTipsLabel.hidden = YES;
    }
}

- (void)resetPos
{
    CGRect rc = self.frame;
    rc.origin.y = self.scrollView.contentSize.height + 10.0f;
    self.frame = rc;
}

#pragma mark - ScrollViewInset
- (void)setupScrollViewContentInsetForLoadingIndicator:(actionLoadMoreHandler)handler
{
    UIEdgeInsets currentInsets = self.scrollView.contentInset;
    currentInsets.bottom = self.bounds.size.height + 20.0;
    
    [self setScrollViewContentInset:currentInsets handler:handler];
}

- (void)resetScrollViewContentInset:(actionLoadMoreHandler)handler
{
    UIEdgeInsets currentInsets = self.scrollView.contentInset;
//    currentInsets.top = self.originalTopInset;
    currentInsets.bottom = self.originalBottomInset;
    [self setScrollViewContentInset:currentInsets handler:handler];
}

- (void)setScrollViewContentInset:(UIEdgeInsets)contentInset handler:(actionLoadMoreHandler)handler
{
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.scrollView.contentInset = contentInset;
                     }
                     completion:^(BOOL finished) {
                         if(handler)
                             handler();
                     }];
}

















@end
