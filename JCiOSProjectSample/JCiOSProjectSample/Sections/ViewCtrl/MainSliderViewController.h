//
//  MainSliderViewController.h
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/6.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "SliderViewController.h"

#define VCID_FirstFlowNaviCtrl                      @"FirstFlowNavigationController"
#define VCID_SecondFlowNaviCtrl                     @"SecondFlowNavigationController"
#define VCID_LeftSideVC                             @"LeftSideViewController"


NS_ENUM(NSInteger, ESliderVCMainViewType)
{
    kESliderVCMainViewType_None             = 0,
    kESliderVCMainViewType_FirstFlow,
    kESliderVCMainViewType_SecondFlow,
};

@interface MainSliderViewController : SliderViewController

@property (nonatomic, strong) NSNumber *eCurrMainViewType;

- (void)showContentControllerWithModel:(NSString*)className;
- (void)showContentControllerWithStoryboardID:(NSString*)storyboardID inStoryboard:(NSString *)storyboardName;


@end
