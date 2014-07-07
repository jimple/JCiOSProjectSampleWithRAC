//
//  MBProgressHUD+creator.h
//  Eventor
//
//  Created by jimple on 14-6-5.
//  Copyright (c) 2014年 Eventor. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (creator)

+ (MBProgressHUD *)createInView:(UIView *)view detailText:(NSString *)detailText;
+ (MBProgressHUD *)createInViewCtrl:(UIViewController *)viewCtrl detailText:(NSString *)detailText;

+ (MBProgressHUD *)createMsgBoxInWindow:(UIWindow *)window msgText:(NSString *)msg hideAfterDelay:(CGFloat)duration;

@end
