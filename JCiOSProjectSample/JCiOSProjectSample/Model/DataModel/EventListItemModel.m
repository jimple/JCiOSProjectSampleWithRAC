//
//  EventListItemModel.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "EventListItemModel.h"

@implementation EventListItemModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"eventID" : @"id",
             @"imgURL" : @"img",
             @"title" : @"name",
             @"count" : @"times",
             };
}

+ (NSValueTransformer *)countJSONTransformer
{
    return [UtilityFunc stringToIntNumberJSONTransformer];
}










@end
