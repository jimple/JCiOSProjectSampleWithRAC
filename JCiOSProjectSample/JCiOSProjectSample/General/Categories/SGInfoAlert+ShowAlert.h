//
//  SGInfoAlert+ShowAlert.h
//  Eventor
//
//  Created by jimple on 14-6-11.
//  Copyright (c) 2014年 Eventor. All rights reserved.
//

#import "SGInfoAlert.h"

@interface SGInfoAlert (ShowAlert)


+ (void)showAlert:(NSString *)strMsg inView:(UIView *)view;
+ (void)showAlert:(NSString *)strMsg duration:(CGFloat)fDuration inView:(UIView *)view;

@end
