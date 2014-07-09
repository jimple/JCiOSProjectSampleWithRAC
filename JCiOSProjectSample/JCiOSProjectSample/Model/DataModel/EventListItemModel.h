//
//  EventListItemModel.h
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import <Mantle.h>

@interface EventListItemModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *eventID;
@property (nonatomic, copy) NSString *imgURL;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSNumber *count;


@end
