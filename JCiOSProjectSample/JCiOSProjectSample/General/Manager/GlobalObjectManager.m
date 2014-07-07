//
//  GlobalObjectManager.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "GlobalObjectManager.h"
#import "MainSliderViewController.h"

@interface GlobalObjectManager ()

@property (nonatomic, strong) MainSliderViewController *mainSliderVC;

@end


@implementation GlobalObjectManager

+ (GlobalObjectManager *)sharedInstance
{
    static GlobalObjectManager *sManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sManager = [[self.class alloc] init];
    });
    
    return sManager;
}


- (void)saveMainSliderVC:(MainSliderViewController *)vc
{
    _mainSliderVC = vc;
}

- (MainSliderViewController *)mainSliderVC
{
    return _mainSliderVC;
}





























@end
