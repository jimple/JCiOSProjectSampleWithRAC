//
//  EventDetailViewModel.h
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/9.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventDetailViewModel : NSObject


- (instancetype)initWithEventID:(NSString *)eventID;

- (void)requestDetail;


@end
