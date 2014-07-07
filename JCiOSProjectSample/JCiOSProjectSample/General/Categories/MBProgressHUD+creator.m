//
//  MBProgressHUD+creator.m
//  Eventor
//
//  Created by jimple on 14-6-5.
//  Copyright (c) 2014年 Eventor. All rights reserved.
//

#import "MBProgressHUD+creator.h"

@implementation MBProgressHUD (creator)

+ (MBProgressHUD *)createInView:(UIView *)view detailText:(NSString *)detailText
{
    APP_ASSERT(view);
    MBProgressHUD *hub = [[MBProgressHUD alloc] initWithView:view];
    hub.removeFromSuperViewOnHide = YES;
    hub.detailsLabelText = detailText;
    hub.mode = MBProgressHUDModeIndeterminate;
    hub.backgroundColor = RGBA(0.0f, 0.0f, 0.0f, 0.3f);
    [view addSubview:hub];
    
    return hub;
}

+ (MBProgressHUD *)createInViewCtrl:(UIViewController *)viewCtrl detailText:(NSString *)detailText
{
    APP_ASSERT(viewCtrl);
    
    MBProgressHUD *hub =[[self class] createInView:viewCtrl.view detailText:detailText];

    
    return hub;
}

+ (MBProgressHUD *)createMsgBoxInWindow:(UIWindow *)window msgText:(NSString *)msg hideAfterDelay:(CGFloat)duration
{
    APP_ASSERT(window && (duration > 0.2f));
    MBProgressHUD *hub = [[MBProgressHUD alloc] initWithWindow:window];
    hub.removeFromSuperViewOnHide = YES;
    hub.detailsLabelText = msg;
    hub.mode = MBProgressHUDModeText;
    hub.backgroundColor = RGBA(0.0f, 0.0f, 0.0f, 0.3f);
    
    [window addSubview:hub];

    [hub show:YES];
    double delayInSeconds = duration;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        [hub hide:YES];
        
        
    });
    
    return hub;
}

@end
