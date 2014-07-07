//
//  BaseSVRRequestOperator.h
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppServerMacro.h"

@class AFHTTPRequestOperation;
@interface BaseSVRRequestOperator : NSObject

@property (nonatomic, strong) AFHTTPRequestOperation *afRequest;

// 停止所有请求
- (void)cancelRequest;

- (void)addAppNameToUserAgent:(NSMutableURLRequest *)objURLRequest;

+ (NSString *)serverDomain;


@end
