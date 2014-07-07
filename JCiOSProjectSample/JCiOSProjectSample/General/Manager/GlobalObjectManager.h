//
//  GlobalObjectManager.h
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MainSliderViewController;
@interface GlobalObjectManager : NSObject

+ (GlobalObjectManager *)sharedInstance;


- (void)saveMainSliderVC:(MainSliderViewController *)vc;
- (MainSliderViewController *)mainSliderVC;



@end
