//
//  SVREventListOperator.h
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "BaseSVRRequestOperator.h"

@interface SVREventListOperator : BaseSVRRequestOperator

- (RACSignal *)getEventListWithPageSize:(NSInteger)pageSize
                                pageNum:(NSInteger)pageNum
                             type1Param:(NSString *)param;


- (RACSignal *)getEventListWithPageSize:(NSInteger)pageSize
                                pageNum:(NSInteger)pageNum
                             type2Param:(NSString *)param;

@end
