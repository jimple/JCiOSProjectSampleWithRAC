//
//  AppDelegate+RootVC.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/10.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "AppDelegate+RootVC.h"
#import "LeftSideViewController.h"

@implementation AppDelegate (RootVC)

- (void)setMainSideVCToRootVC
{
    self.window.rootViewController = (UIViewController *)[GlobalObjectManager sharedInstance].mainSliderVC;
}

- (void)setOtherVCToRootVC
{
    if (!self.otherVC)
    {
        self.otherVC = InstantiateVCFromStoryboard(OtherMainStoryboard, @"MainTabBarController");
    }else{}
    
    self.window.rootViewController = self.otherVC;
}

@end
