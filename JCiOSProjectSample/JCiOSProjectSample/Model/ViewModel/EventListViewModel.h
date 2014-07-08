//
//  EventListViewModel.h
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "BaseServerDataListViewModel.h"

@class EventListItemCellViewModel;
@interface EventListViewModel : BaseServerDataListViewModel

- (EventListItemCellViewModel *)cellViewModelAtIndex:(NSInteger)index;












@end
