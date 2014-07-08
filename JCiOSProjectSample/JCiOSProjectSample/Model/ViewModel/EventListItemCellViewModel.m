//
//  EventListItemCellViewModel.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/8.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "EventListItemCellViewModel.h"
#import "EventListItemModel.h"


@interface EventListItemCellViewModel ()

@property (nonatomic, strong) EventListItemModel *eventItemDataMode;

@end

@implementation EventListItemCellViewModel


- (void)setDataModel:(EventListItemModel *)model
{
    APP_ASSERT(model);
    _eventItemDataMode = model;
}

- (NSString *)imageURL
{
    APP_ASSERT(_eventItemDataMode);
    return _eventItemDataMode.imgURL;
}

- (NSString *)title
{
    APP_ASSERT(_eventItemDataMode);
    return _eventItemDataMode.title;
}


























@end
