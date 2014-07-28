//
//  UIButton+SpringTouch.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/28.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "UIButton+SpringTouch.h"
#import <POP.h>

@implementation UIButton (SpringTouch)


- (void)initSpringTouch
{
    [self addTarget:self action:@selector(springTouchBtnTouchDown:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(springTouchBtnTouchUp:) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
}

- (void)removeSpringTouch
{
    [self removeTarget:self action:@selector(springTouchBtnTouchDown:) forControlEvents:UIControlEventTouchDown];
    [self removeTarget:self action:@selector(springTouchBtnTouchUp:) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
}

- (void)springTouchBtnTouchDown:(id)sender
{
    UIView *btn = (UIView *)sender;
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(0.9, 0.9)];
    animation.springBounciness = 10;
    [btn.layer pop_addAnimation:animation forKey:@"ZoomOutY"];
}

- (void)springTouchBtnTouchUp:(id)sender
{
    UIView *btn = (UIView *)sender;
    
    [btn.layer pop_removeAnimationForKey:@"ZoomOutY"];
    
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
    animation.springBounciness = 10;
    
    [btn.layer pop_addAnimation:animation forKey:@"ZoomOutYReverse"];
}


@end
