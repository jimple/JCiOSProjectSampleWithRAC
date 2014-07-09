//
//  EventDetailViewModel.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/9.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "EventDetailViewModel.h"


@interface EventDetailViewModel ()

@property (nonatomic, copy) NSString *eventID;


@end


@implementation EventDetailViewModel

- (instancetype)initWithEventID:(NSString *)eventID
{
    self  = [super init];
    if (self)
    {
        APP_ASSERT(StringNotEmpty(eventID));
        _eventID = eventID;
        
    }else{}
    return self;
}

- (void)dealloc
{
    
}

- (void)requestDetail
{
    APP_ASSERT(_eventID);
    
    
}
































@end
