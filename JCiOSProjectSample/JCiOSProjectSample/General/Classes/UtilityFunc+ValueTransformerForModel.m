//
//  UtilityFunc+ValueTransformerForModel.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "UtilityFunc+ValueTransformerForModel.h"
#import "MTLValueTransformer.h"
#import <Mantle.h>

@implementation UtilityFunc (ValueTransformerForModel)

// 1970至今秒数转NSDate
+ (NSValueTransformer *)dateFromSecondSince1970JSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return (str.doubleValue > 1) ? [NSDate dateWithTimeIntervalSince1970:str.doubleValue] : nil;
    } reverseBlock:^(NSDate *date) {
        return (date ? [NSString stringWithFormat:@"%f",[date timeIntervalSince1970]] : @"0");
    }];
}

// string -> float number
+ (NSValueTransformer *)stringToFloatNumberJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return @((StringNotEmpty(str) ? [str floatValue] : 0));
    } reverseBlock:^(NSNumber *num) {
        return (num ? [NSString stringWithFormat:@"%f",[num floatValue]] : @"0");
    }];
}

// string -> int number
+ (NSValueTransformer *)stringToIntNumberJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return @((StringNotEmpty(str) ? [str intValue] : 0));
    } reverseBlock:^(NSNumber *num) {
        return (num ? [NSString stringWithFormat:@"%d",[num intValue]] : @"0");
    }];
}

// string -> bool number  1=YES  other=NO
+ (NSValueTransformer *)stringToBoolNumberJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *isTrue) {
        if (StringNotEmpty(isTrue))
        {
            return @([isTrue isEqualToString:@"1"]);
        }
        else
        {
            return @(NO);
        }
    } reverseBlock:^(NSNumber *isTrue){
        return ([isTrue boolValue] ? @"1" : @"0");
    }];
}

// string -> array with modelClass
+ (NSValueTransformer *)arrayJSONTransformerWithModelClass:(Class)modelClass
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id (NSArray *data) {
        BOOL canTransformToArray = NO;
        if (!data || [data isKindOfClass:NSString.class])
        {
            NSString *strData = (NSString *)data;
            if (StringNotEmpty(strData))
            {
                canTransformToArray = YES;
            }
            else
            {
                canTransformToArray = NO;
            }
        }
        else
        {
            canTransformToArray = (data.count > 0);
        }
        
        if (canTransformToArray)
        {
            return [[MTLValueTransformer mtl_JSONArrayTransformerWithModelClass:modelClass] transformedValue:data];
        }
        else
        {
            return [[NSArray alloc] init];
        }
    } reverseBlock:^(NSArray *array){
        return ((array && (array.count > 0))
                ? [[MTLValueTransformer mtl_JSONArrayTransformerWithModelClass:modelClass] reverseTransformedValue:array]
                : @"[]");
    }];
}


@end
