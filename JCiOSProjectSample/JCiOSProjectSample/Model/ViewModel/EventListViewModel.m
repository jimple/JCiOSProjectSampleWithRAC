//
//  EventListViewModel.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "EventListViewModel.h"
#import "SVREventListOperator.h"
#import "EventListItemModel.h"
#import "EventListItemCellViewModel.h"

@interface EventListViewModel ()

@property (nonatomic, strong) NSMutableArray *cellViewModelArray;
@property (nonatomic, strong) SVREventListOperator *svrOper;

@end


@implementation EventListViewModel

- (instancetype)init
{
    self  = [super init];
    if (self)
    {
        _cellViewModelArray = [[NSMutableArray alloc] init];
        _svrOper = [[SVREventListOperator alloc] init];
        
    }else{}
    return self;
}

- (void)dealloc
{
    [_svrOper cancelRequest];
}

- (EventListItemCellViewModel *)cellViewModelAtIndex:(NSInteger)index
{
    APP_ASSERT(_cellViewModelArray);
    EventListItemCellViewModel *cellViewModel;
    
    if ((index >= 0) && (index < _cellViewModelArray.count))
    {
        cellViewModel = _cellViewModelArray[index];
    }else{APP_ASSERT_STOP}
    
    return cellViewModel;
}

// overwrite
- (void)loadMore
{
    self.isNoMore = @(NO);
    
    @weakify(self);
    [[[_svrOper getEventListWithPageSize:self.pageSize pageNum:self.pageNum type1Param:@"temp"] deliverOn:RACScheduler.mainThreadScheduler]
     subscribeNext:^(NSArray *eventInfoArray)
     {
         @strongify(self);
         if (eventInfoArray && (eventInfoArray.count > 0))
         {
             self.pageNum++;
             
             for (EventListItemModel *dataModel in eventInfoArray)
             {
                 [self.dataArray addObject:dataModel];
                 
                 EventListItemCellViewModel *cellViewModel = [[EventListItemCellViewModel alloc] init];
                 [cellViewModel setDataModel:dataModel];
                 [self.cellViewModelArray addObject:cellViewModel];
             }
             
             self.appendItemCount = @(eventInfoArray.count);
             if (eventInfoArray.count < self.pageSize)
             {
                 self.isNoMore  = @(YES);
             }else{}
         }
         else
         {
             self.isNoMore  = @(YES);
         }
     }
     error:^(NSError *error)
     {
         @strongify(self);
         self.requestError = error;
     }];
}





























@end
