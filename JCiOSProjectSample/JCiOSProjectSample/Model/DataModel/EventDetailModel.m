//
//  EventDetailModel.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/9.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "EventDetailModel.h"

@implementation EventDetailModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"eventID" : @"id",
             @"description" : @"desc",
             @"publishDate" : @"time",
             };
}

+ (NSValueTransformer *)publishDateJSONTransformer
{
    return [UtilityFunc dateFromSecondSince1970JSONTransformer];
}







@end
