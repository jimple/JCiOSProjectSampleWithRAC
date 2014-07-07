//
//  BaseSVRRequestOperator.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "BaseSVRRequestOperator.h"
#import "AFHTTPRequestOperation.h"

@implementation BaseSVRRequestOperator

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        
    }else{}
    return self;
}

-(void)dealloc
{
    [self cancelRequest];
}

// 停止所有请求
- (void)cancelRequest
{
    if (_afRequest)
    {
        [_afRequest cancel];
        _afRequest = nil;
    }else{}
}

- (void)addAppNameToUserAgent:(NSMutableURLRequest *)objURLRequest
{
    /*
     必须重设agent，因为AFNetworking中这样定义：
     userAgent = [NSString stringWithFormat:@"%@/%@ (%@; iOS %@; Scale/%0.2f)", [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleExecutableKey] ?: [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleIdentifierKey], (__bridge id)CFBundleGetValueForInfoDictionaryKey(CFBundleGetMainBundle(), kCFBundleVersionKey) ?: [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleVersionKey], [[UIDevice currentDevice] model], [[UIDevice currentDevice] systemVersion], ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] ? [[UIScreen mainScreen] scale] : 1.0f)];
     
     而服务端需要检测 Eventor 字符串，所以手动修改Agent内容。
     之所以不直接修改afnetworking代码，是怕更新代码版本时很容易忘记修改。
     */
    if (objURLRequest)
    {
        NSString *strValue = [objURLRequest valueForHTTPHeaderField:@"User-Agent"];
        
        NSString *strOld = [NSString stringWithFormat:@"%@/%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleExecutableKey] ?: [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleIdentifierKey], (__bridge id)CFBundleGetValueForInfoDictionaryKey(CFBundleGetMainBundle(), kCFBundleVersionKey) ?: [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleVersionKey]];
        NSString *strNew = [NSString stringWithFormat:@"%@/%@", AppName, AppVersionNumber];
        NSString *strNewValue = [strValue stringByReplacingOccurrencesOfString:strOld withString:strNew];
        
        [objURLRequest setValue:strNewValue forHTTPHeaderField:@"User-Agent"];
    }else{APP_ASSERT_STOP}
}



+ (NSString *)serverDomain
{
    return STR_ServerDomain;
}



























@end
