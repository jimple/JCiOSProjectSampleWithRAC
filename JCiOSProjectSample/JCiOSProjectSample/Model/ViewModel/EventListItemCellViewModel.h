//
//  EventListItemCellViewModel.h
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/8.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EventListItemModel;
@interface EventListItemCellViewModel : NSObject

- (NSString *)imageURL;
- (NSString *)title;


- (void)setDataModel:(EventListItemModel *)model;


@end
