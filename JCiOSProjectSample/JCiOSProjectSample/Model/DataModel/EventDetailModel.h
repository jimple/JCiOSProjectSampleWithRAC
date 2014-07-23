//
//  EventDetailModel.h
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/9.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import <Mantle.h>

@interface EventDetailModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *eventID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, strong) NSDate *publishDate;


@end
