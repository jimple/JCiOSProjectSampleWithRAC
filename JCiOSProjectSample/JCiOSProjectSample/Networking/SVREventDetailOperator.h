//
//  SVREventDetailOperator.h
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/9.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "BaseSVRRequestOperator.h"

@interface SVREventDetailOperator : BaseSVRRequestOperator

- (RACSignal *)getDetailByID:(NSString *)eventID;



@end
