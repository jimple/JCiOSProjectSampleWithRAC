//
//  LeftSideViewTabHelper.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "LeftSideViewTabHelper.h"
#import "MainSliderViewController.h"

@implementation LeftSideViewTabHelper

+ (LeftSideViewTabHelper *)sharedInstance
{
    static LeftSideViewTabHelper *sHelper;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sHelper = [[self.class alloc] init];
    });
    
    return sHelper;
}

- (void)selectFirstFlowTab
{
    [[GlobalObjectManager sharedInstance].mainSliderVC showContentControllerWithStoryboardID:VCID_FirstFlowNaviCtrl inStoryboard:FirstFlowStoryboard];
}

- (void)selectSecondFlowTab
{
    [[GlobalObjectManager sharedInstance].mainSliderVC showContentControllerWithStoryboardID:VCID_SecondFlowNaviCtrl inStoryboard:SecondFlowStoryboard];
}





@end
