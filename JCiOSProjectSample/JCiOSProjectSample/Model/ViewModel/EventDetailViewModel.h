//
//  EventDetailViewModel.h
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/9.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventDetailViewModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *requestErrMsg;
@property (nonatomic, strong) NSNumber *isRequestFinished;
@property (nonatomic, copy) NSString *moreInfo;

@property(nonatomic, strong) RACCommand *getMoreDataCommand;


- (instancetype)initWithEventID:(NSString *)eventID;
- (void)requestDetail;


@end
