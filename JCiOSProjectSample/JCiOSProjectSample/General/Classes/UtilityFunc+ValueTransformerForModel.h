//
//  UtilityFunc+ValueTransformerForModel.h
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "UtilityFunc.h"

@interface UtilityFunc (ValueTransformerForModel)

// 1970至今秒数转NSDate
+ (NSValueTransformer *)dateFromSecondSince1970JSONTransformer;

// string -> float number
+ (NSValueTransformer *)stringToFloatNumberJSONTransformer;

// string -> int number
+ (NSValueTransformer *)stringToIntNumberJSONTransformer;

// string -> bool number  1=YES  other=NO
+ (NSValueTransformer *)stringToBoolNumberJSONTransformer;

// string -> array with modelClass
+ (NSValueTransformer *)arrayJSONTransformerWithModelClass:(Class)modelClass;

@end
