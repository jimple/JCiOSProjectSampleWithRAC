//
//  BaseServerDataListViewModel.h
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseServerDataListViewModel : NSObject

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, assign) NSInteger pageNum;


@property (nonatomic, strong) NSNumber *isNoMore;
@property (nonatomic, strong) NSError *requestError;
@property (nonatomic, strong) NSNumber *appendItemCount;


- (NSInteger)itemCount;
- (void)refreshList;
- (void)loadMore;   // 纯虚函数




@end
