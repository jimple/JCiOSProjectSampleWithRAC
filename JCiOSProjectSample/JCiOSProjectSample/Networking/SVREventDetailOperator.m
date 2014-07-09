//
//  SVREventDetailOperator.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/9.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "SVREventDetailOperator.h"
#import "AFHTTPRequestOperation.h"
#import "AFURLRequestSerialization.h"
#import "EventDetailModel.h"

@implementation SVREventDetailOperator

- (RACSignal *)getDetailByID:(NSString *)eventID
{
    APP_ASSERT(StringNotEmpty(eventID));
    
    @weakify(self);
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber){
        @strongify(self);
        NSMutableString *strURL = [[NSMutableString alloc] initWithString:@""];
        [strURL appendString:[NSString stringWithFormat:@"%@", @"http://imgur.com/gallery.json"/*[BaseSVRRequestOperator serverDomain]*/]];
        
        NSMutableDictionary *dicParam = [[NSMutableDictionary alloc] init];
        [dicParam setObject:eventID forKey:@"id"];
        
        [self cancelRequest];
        
        AFHTTPRequestSerializer <AFURLRequestSerialization> * requestSerializer = [AFHTTPRequestSerializer serializer];
        NSMutableURLRequest *request = [requestSerializer requestWithMethod:@"GET" URLString:[[NSURL URLWithString:strURL] absoluteString] parameters:dicParam error:nil];
        
        [self addAppNameToUserAgent:request];    // 重设UserAgent
        
        self.afRequest = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        self.afRequest.responseSerializer = [AFJSONResponseSerializer serializer];
        
        NSMutableSet *set = [[NSMutableSet alloc] initWithSet:self.afRequest.responseSerializer.acceptableContentTypes];
        [set addObject:@"application/x-javascript"];
        self.afRequest.responseSerializer.acceptableContentTypes = set;
        
        [self.afRequest setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             
             ////////////////////////////////////////////////////////////////
             // 假数据
             NSDictionary *responseDic = @{@"id" : @"123",
                                           @"desc" : @"abcdefg",
                                           @"time" : [NSString stringWithFormat:@"%f", [[NSDate date] timeIntervalSince1970]]
                                           };
             ////////////////////////////////////////////////////////////////

             EventDetailModel *detail = [MTLJSONAdapter modelOfClass:[EventDetailModel class] fromJSONDictionary:responseDic error:nil];

             [subscriber sendNext:detail];
             [subscriber sendCompleted];
         }failure:^(AFHTTPRequestOperation *operation, NSError *error)
         {
             [subscriber sendError:error];
         }];
        
        [self.afRequest start];
        
        return [RACDisposable disposableWithBlock:^
                {
                }];
    }] doError:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

@end
