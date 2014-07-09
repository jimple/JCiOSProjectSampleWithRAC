//
//  EventDetailViewModel.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/9.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "EventDetailViewModel.h"
#import "SVREventDetailOperator.h"
#import "EventDetailModel.h"

@interface EventDetailViewModel ()

@property (nonatomic, copy) NSString *eventID;
@property (nonatomic, strong) SVREventDetailOperator *svrOper;
@property(nonatomic, strong) RACSignal *requestFinishSignal;

@end


@implementation EventDetailViewModel

- (instancetype)initWithEventID:(NSString *)eventID
{
    self  = [super init];
    if (self)
    {
        APP_ASSERT(StringNotEmpty(eventID));
        _eventID = eventID;
        _svrOper = [[SVREventDetailOperator alloc] init];
        
    }else{}
    return self;
}

- (void)dealloc
{
    if (_svrOper)
    {
        [_svrOper cancelRequest];
    }else{}
}

- (void)requestDetail
{
    APP_ASSERT(_eventID);
    @weakify(self);
    [[_svrOper getDetailByID:_eventID] subscribeNext:^(EventDetailModel *detailModel) {
        @strongify(self);
        if (detailModel)
        {
            self.title = detailModel.name;
            self.description = detailModel.description;
        }
        else
        {
            self.requestErrMsg = @"error";
        }
    } error:^(NSError *error) {
        @strongify(self);
        self.isRequestFinished = @(YES);
        self.requestErrMsg = @"error";
    } completed:^{
        @strongify(self);
        self.isRequestFinished = @(YES);
    }];
}

- (RACCommand *)getMoreDataCommand
{
	if (!_getMoreDataCommand)
    {
		@weakify(self);
		_getMoreDataCommand = [[RACCommand alloc] initWithEnabled:self.requestFinishSignal signalBlock:^RACSignal *(id input) {
            double delayInSeconds = 1.2f;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                @strongify(self);
                self.moreInfo = @"More Info.";
            });
            return [RACSignal empty];
		}];
	}else{}
    
	return _getMoreDataCommand;
}

#pragma mark -
- (RACSignal *)requestFinishSignal
{
	if (!_requestFinishSignal)
    {
		_requestFinishSignal = [RACObserve(self, isRequestFinished) map:^id(NSNumber *isFinished) {
			return (isFinished && isFinished.boolValue) ? @(YES) : @(NO);
		}];
	}else{}
    
	return _requestFinishSignal;
}




























@end
