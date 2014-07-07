//
//  LeftSideViewTabHelper.h
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LeftSideViewTabHelper : NSObject

+ (LeftSideViewTabHelper *)sharedInstance;

- (void)selectFirstFlowTab;
- (void)selectSecondFlowTab;


@end
