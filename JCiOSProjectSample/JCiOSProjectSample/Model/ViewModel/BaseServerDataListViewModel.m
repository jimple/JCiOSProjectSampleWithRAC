//
//  BaseServerDataListViewModel.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "BaseServerDataListViewModel.h"

static const NSInteger sPageSize = 20;
static const NSInteger sOriginalPageNum = 1;


@interface BaseServerDataListViewModel ()

@end

@implementation BaseServerDataListViewModel

- (id)init
{
    self = [super init];
    if (self)
    {
        _dataArray = [[NSMutableArray alloc] init];
        _pageSize = sPageSize;
        _pageNum = sOriginalPageNum;
    }else{}
    return self;
}

- (void)dealloc
{
}

- (NSInteger)itemCount
{
    return (_dataArray ? _dataArray.count : 0);
}

- (void)refreshList
{
    [_dataArray removeAllObjects];
    _pageNum = sOriginalPageNum;
    
    [self loadMore];
}

- (void)loadMore
{
    APP_DebugLogRed(@"\n\n子类必须重载此函数\n\n");
    APP_ASSERT_STOP
}




















@end
