//
//  UtilityFunc.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "UtilityFunc.h"
#import <CoreLocation/CoreLocation.h>

@implementation UtilityFunc


// 是否4英寸屏幕
+ (BOOL)is4InchScreen
{
    static BOOL bIs4Inch = NO;
    static BOOL bIsGetValue = NO;
    
    if (!bIsGetValue)
    {
        CGRect rcAppFrame = [UIScreen mainScreen].bounds;
        bIs4Inch = (rcAppFrame.size.height == 568.0f);
        
        bIsGetValue = YES;
    }else{}
    
    return bIs4Inch;
}

// 获取屏幕宽度
+ (CGFloat)getScreenWidth
{
    static CGRect rcScreenFrame;
    static BOOL bIsGetScreen = NO;
    
    if (!bIsGetScreen)
    {
        rcScreenFrame = [UIScreen mainScreen].bounds;
        
        bIsGetScreen = YES;
    }else{}
    
    return rcScreenFrame.size.width;
}

// 获取屏幕高度
+ (CGFloat)getScreenHeight
{
    static CGRect rcScreenFrame;
    static BOOL bIsGetScreen = NO;
    
    if (!bIsGetScreen)
    {
        rcScreenFrame = [UIScreen mainScreen].bounds;
        
        bIsGetScreen = YES;
    }else{}
    
    return rcScreenFrame.size.height;
}

// 日期转字符串
+ (NSString *)getStringFromDate:(NSDate *)date byFormat:(NSString *)strFormat
{
    NSString *strRet = nil;
    if (date && strFormat)
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeZone:[NSTimeZone defaultTimeZone]];
        
        [dateFormatter setDateFormat:strFormat];
        strRet = [dateFormatter stringFromDate:date];
    }else{}
    
    return strRet;
}
// 字符串转日期
+ (NSDate *)getDateFromString:(NSString *)strDate byFormat:(NSString *)strDateFormat
{
    NSDate *dateRet = nil;
    if (strDate && strDateFormat && (strDate.length == strDateFormat.length))
    {
        NSDateFormatter *objDateFmt = [[NSDateFormatter alloc] init];
        [objDateFmt setTimeZone:[NSTimeZone defaultTimeZone]];
        [objDateFmt setDateFormat:strDateFormat];
        dateRet = [objDateFmt dateFromString:strDate];
    }else{}
    
    return dateRet;
}

// label设置最小字体大小
+ (void)label:(UILabel *)label setMiniFontSize:(CGFloat)fMiniSize forNumberOfLines:(NSInteger)iLines
{
    if (label)
    {
        label.adjustsFontSizeToFitWidth = YES;
        label.minimumScaleFactor = fMiniSize/label.font.pointSize;
    }else{}
}

// 清除PerformRequests和notification
+ (void)cancelPerformRequestAndNotification:(UIViewController *)viewCtrl
{
    if (viewCtrl)
    {
        [[viewCtrl class] cancelPreviousPerformRequestsWithTarget:viewCtrl];
        [[NSNotificationCenter defaultCenter] removeObserver:viewCtrl];
    }else{}
}

// 重设scroll view的内容区域和滚动条区域
+ (void)resetScrlView:(UIScrollView *)sclView contentInsetWithNaviBar:(BOOL)bHasNaviBar tabBar:(BOOL)bHasTabBar
{
    if (sclView)
    {
        UIEdgeInsets inset = sclView.contentInset;
        UIEdgeInsets insetIndicator = sclView.scrollIndicatorInsets;
        CGFloat fTopInset = bHasNaviBar ? NaviBarHeight : 0.0f;
        CGFloat fTopIndicatorInset = bHasNaviBar ? NaviBarHeight : 0.0f;
        CGFloat fBottomInset = bHasTabBar ? TabBarHeight : 0.0f;
        
        fTopInset += StatusBarHeight;
        fTopIndicatorInset += StatusBarHeight;

        insetIndicator.top += fTopIndicatorInset;
        insetIndicator.bottom += fBottomInset;
        [sclView setScrollIndicatorInsets:insetIndicator];
        
        inset.top += fTopInset;
        inset.bottom += fBottomInset;
        [sclView setContentInset:inset];
    }else{}
}

// 按找状态栏高度的倍数来重设scroll view的内容区域和滚动条区域
+ (void)resetScrlView:(UIScrollView *)sclView contentInsetStatusBarTimes:(NSInteger)contentTimes indicatorInsetStatusBarTimes:(NSInteger)indicatorTimes
{
    if (sclView)
    {
        UIEdgeInsets inset = sclView.contentInset;
        UIEdgeInsets insetIndicator = sclView.scrollIndicatorInsets;
        CGPoint ptContentOffset = sclView.contentOffset;
        CGFloat fTopInset = 0.0f;
        CGFloat fTopIndicatorInset = 0.0f;
        
        fTopInset += StatusBarHeight * contentTimes;
        fTopIndicatorInset += StatusBarHeight * indicatorTimes;
        
        inset.top += fTopInset;
        [sclView setContentInset:inset];
        
        insetIndicator.top += fTopIndicatorInset;
        [sclView setScrollIndicatorInsets:insetIndicator];
        
        ptContentOffset.y -= fTopInset;
        [sclView setContentOffset:ptContentOffset];
    }else{}
}
// 指定高度重设内容区域和滚动条区域
+ (void)resetScrlView:(UIScrollView *)sclView contentInset:(CGFloat)contentInset indicatorInset:(CGFloat)indicatorInset
{
    if (sclView)
    {
        UIEdgeInsets inset = sclView.contentInset;
        UIEdgeInsets insetIndicator = sclView.scrollIndicatorInsets;
        CGPoint ptContentOffset = sclView.contentOffset;
        CGFloat fTopInset = 0.0f;
        CGFloat fTopIndicatorInset = 0.0f;
        
        fTopInset += contentInset;
        fTopIndicatorInset += indicatorInset;
        
        inset.top += fTopInset;
        [sclView setContentInset:inset];
        
        insetIndicator.top += fTopIndicatorInset;
        [sclView setScrollIndicatorInsets:insetIndicator];
        
        ptContentOffset.y -= fTopInset;
        [sclView setContentOffset:ptContentOffset];
    }else{}
}

// 从故事版获取VC
+ (id)viewCtrlFormStoryboard:(NSString *)storyboardName viewCtrlID:(NSString *)viewCtrlID
{
    APP_ASSERT(storyboardName && viewCtrlID);
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    
    APP_ASSERT(storyBoard);
    id ret = [storyBoard instantiateViewControllerWithIdentifier:viewCtrlID];
    
    return  ret;
}

// 创建UILabel
+ (UILabel *)createLabelWithFrame:(CGRect)rc fontSize:(CGFloat)fFontSize txtColor:(UIColor *)clrTxt
{
    return [[self class] createLabelWithFrame:rc fontSize:fFontSize txtColor:clrTxt isBoldFont:NO];
}
+ (UILabel *)createLabelWithFrame:(CGRect)rc fontSize:(CGFloat)fFontSize txtColor:(UIColor *)clrTxt isBoldFont:(BOOL)bIsBold
{
    return [[self class] createLabelWithFrame:rc fontSize:fFontSize txtColor:clrTxt isBoldFont:bIsBold txtAlignment:NSTextAlignmentLeft];
}
+ (UILabel *)createLabelWithFrame:(CGRect)rc fontSize:(CGFloat)fFontSize txtColor:(UIColor *)clrTxt isBoldFont:(BOOL)bIsBold txtAlignment:(NSTextAlignment)alignment
{
    UILabel *label = [[UILabel alloc] initWithFrame:rc];
    label.textColor = clrTxt;
    label.font = bIsBold ? [UIFont boldSystemFontOfSize:fFontSize] : [UIFont systemFontOfSize:fFontSize];
    label.textAlignment = alignment;
    label.backgroundColor = [UIColor clearColor];
    //    label.lineBreakMode = NSLineBreakByCharWrapping;
    
    return label;
}

// 心跳动画
+ (void)heartbeatView:(UIView *)view duration:(CGFloat)fDuration
{
    [[self class] heartbeatView:view duration:fDuration maxSize:1.4f durationPerBeat:0.5f];
}
+ (void)heartbeatView:(UIView *)view duration:(CGFloat)fDuration maxSize:(CGFloat)fMaxSize durationPerBeat:(CGFloat)fDurationPerBeat
{
    if (view && (fDurationPerBeat > 0.1f))
    {
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        
        CATransform3D scale1 = CATransform3DMakeScale(0.9, 0.9, 1);
        CATransform3D scale2 = CATransform3DMakeScale(fMaxSize, fMaxSize, 1);
        CATransform3D scale3 = CATransform3DMakeScale(1.0, 1.0, 1);
        
        NSArray *frameValues = [NSArray arrayWithObjects:
                                [NSValue valueWithCATransform3D:scale1],
                                [NSValue valueWithCATransform3D:scale2],
                                [NSValue valueWithCATransform3D:scale3],
                                nil];
        
        [animation setValues:frameValues];
        
        NSArray *frameTimes = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0.1],
                               [NSNumber numberWithFloat:0.5],
                               [NSNumber numberWithFloat:1.0],
                               nil];
        [animation setKeyTimes:frameTimes];
        
        animation.fillMode = kCAFillModeForwards;
        animation.duration = fDurationPerBeat;
        animation.repeatCount = fDuration/fDurationPerBeat;
        
        [view.layer addAnimation:animation forKey:@"heartbeatView"];
    }else{}
}

// Table滚动时TableCell内ImageView视差显示
+ (void)cell:(UITableViewCell *)cell onTableView:(UITableView *)tableView didScrollOnView:(UIView *)view parallaxImgView:(UIImageView *)imgView
{
    APP_ASSERT(cell && tableView && view && imgView);
    CGRect rectInSuperview = [tableView convertRect:cell.frame toView:tableView];
    rectInSuperview.origin.y -= tableView.contentOffset.y;
    
    float distanceFromCenter = CGRectGetHeight(view.frame)/2 - CGRectGetMinY(rectInSuperview);
    float difference = CGRectGetHeight(imgView.frame) - CGRectGetHeight(cell.frame);
    float move = (distanceFromCenter / CGRectGetHeight(view.frame)) * difference;
    
    CGRect imageRect = imgView.frame;
    imageRect.origin.y = -(difference/2)+move;
    imgView.frame = imageRect;
}

// 解析出URL的参数
+ (NSDictionary *)paramFromURL:(NSURL *)URL
{
    NSDictionary *dicRet;
    
    if (URL && URL.query)
    {
        NSStringEncoding encoding = NSUTF8StringEncoding;
        
        NSCharacterSet* delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&;"];
        NSMutableDictionary* pairs = [NSMutableDictionary dictionary];
        NSScanner* scanner = [[NSScanner alloc] initWithString:URL.query];
        while (![scanner isAtEnd])
        {
            NSString* pairString = nil;
            [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
            [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
            NSArray* kvPair = [pairString componentsSeparatedByString:@"="];
            if (kvPair.count == 2) {
                NSString* key = [[kvPair objectAtIndex:0]
                                 stringByReplacingPercentEscapesUsingEncoding:encoding];
                NSString* value = [[kvPair objectAtIndex:1]
                                   stringByReplacingPercentEscapesUsingEncoding:encoding];
                
                // value中的加号+ 替换为空格
                value = [value stringByReplacingOccurrencesOfString:@"+" withString:@" "];
                
                [pairs setObject:value forKey:key];
            }
        }
        
        dicRet = [NSDictionary dictionaryWithDictionary:pairs];
    }else{}
    
    return dicRet;
}

// 创建编辑框
+ (UITextField *)createNormalTextFieldWithFrame:(CGRect)rcFrame placeHolder:(NSString *)strPlaceholder
{
    return [[self class] createNormalTextFieldWithFrame:rcFrame placeHolder:strPlaceholder keyboardType:UIKeyboardTypeDefault];
}
+ (UITextField *)createNormalTextFieldWithFrame:(CGRect)rcFrame placeHolder:(NSString *)strPlaceholder keyboardType:(UIKeyboardType)eKeyboardType
{
    UITextField *txtField;
    txtField = [[UITextField alloc] initWithFrame:rcFrame];
    txtField.placeholder = strPlaceholder;
    txtField.userInteractionEnabled = YES;
    [txtField setBorderStyle:UITextBorderStyleNone]; //外框类型
    txtField.autocorrectionType = UITextAutocorrectionTypeNo;
    txtField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    txtField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    txtField.returnKeyType = UIReturnKeyDone;//返回键的类型
    txtField.keyboardType = eKeyboardType;//键盘类型
    txtField.leftView = [[UIView alloc] initWithFrame:Rect(0.0f, 0.0f, 5.0f, 30.0f)];
    txtField.leftViewMode = UITextFieldViewModeAlways;
    txtField.font = [UIFont systemFontOfSize:14.0f];
    
    txtField.backgroundColor = COLOR_AppWhite;
    txtField.layer.borderWidth = 1.0f;
    txtField.layer.borderColor = COLOR_AppWhite.CGColor;
    txtField.layer.masksToBounds = NO;
    txtField.layer.cornerRadius = FLOAT_CornerRadius;
    
    return txtField;
}

// 下拉选择样式的按钮
+ (void)setDropdownItemBtnStyle:(UIButton *)btn
{
    [[self class] setDropdownItemBtnStyle:btn isContentAlignmentLeft:YES];
}
+ (void)setDropdownItemBtnStyle:(UIButton *)btn isContentAlignmentLeft:(BOOL)bIsAlignmentLeft
{
    APP_ASSERT(btn);
    [btn setTitleColor:COLOR_TextMidLightGray forState:UIControlStateNormal];
    [btn setTitleColor:COLOR_TextDark forState:UIControlStateHighlighted];
    btn.titleLabel.textAlignment = NSTextAlignmentLeft;
    btn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    [btn setBackgroundImage:[[UIImage imageNamed:@"select-g"] resizableImageWithCapInsets:UIEdgeInsetsMake(4, 4, 15, 15)] forState:UIControlStateNormal];
    
    if (bIsAlignmentLeft)
    {
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(2, 5, 1, 16)];
        [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    }
    else
    {
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(2, 2, 1, 16)];
    }
}

// 视图添加一个光晕
+ (void)viewShowRedShadow:(UIView *)view
{
    [[self class] view:view showShadowWithColor:[UIColor redColor]];
}
+ (void)view:(UIView *)view showShadowWithColor:(UIColor *)color
{
    if (view && color)
    {
        view.layer.shadowColor = color.CGColor;
        view.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
        view.layer.shadowOpacity = 0.8f;
        view.layer.shadowRadius = 2.0f;
    }else{}
}
+ (void)viewRemoveShadow:(UIView *)view
{
    if (view)
    {
        view.layer.shadowOpacity = 0.0f;
        view.layer.shadowRadius = 0.0f;
    }
}

// 计算两坐标点间的距离
+ (CGFloat)distanceFromLat:(CGFloat)fromLat lng:(CGFloat)fromLng toLat:(CGFloat)toLat lng:(CGFloat)toLng
{
    CLLocation *src = [[CLLocation alloc] initWithLatitude:fromLat longitude:fromLng];
    CLLocation *dest = [[CLLocation alloc] initWithLatitude:toLat longitude:toLng];
    CLLocationDistance distance = [src distanceFromLocation:dest];
    return distance;
}


+(BOOL)judgeNotification
{
    BOOL OpenNotification = YES;
    if ([[UIApplication sharedApplication] enabledRemoteNotificationTypes] == 0){
        OpenNotification = NO;
    }else if ([[UIApplication sharedApplication] enabledRemoteNotificationTypes] == 1){
        OpenNotification = YES;
    }else if ([[UIApplication sharedApplication] enabledRemoteNotificationTypes] == 2){
        OpenNotification = YES;
    }else if ([[UIApplication sharedApplication] enabledRemoteNotificationTypes] == 3){
        OpenNotification = YES;
    }else if ([[UIApplication sharedApplication] enabledRemoteNotificationTypes] == 4){
        OpenNotification = YES;
    }else if ([[UIApplication sharedApplication] enabledRemoteNotificationTypes] == 5){
        OpenNotification = YES;
    }else if ([[UIApplication sharedApplication] enabledRemoteNotificationTypes] == 6){
        OpenNotification = YES;
    }else if ([[UIApplication sharedApplication] enabledRemoteNotificationTypes] == 7){
        OpenNotification = YES;
    }
    return OpenNotification;
    
}

+ (NSString *)distanceStrFromLat:(CGFloat)fromLat lng:(CGFloat)fromLng toLat:(CGFloat)toLat lng:(CGFloat)toLng
{
    NSString *distanceStr = @"";
    CGFloat distance = [self.class distanceFromLat:fromLat lng:fromLng toLat:toLat lng:toLng];
    if (distance < 1000 * 1000) // 超过这个距离就不显示了
    {
        int iDistance = (int)distance;
        if (iDistance < 1000)
        {// 小于1km，显示m
            distanceStr = [NSString stringWithFormat:@"%dm", iDistance];
        }
        else
        {
            distanceStr = [NSString stringWithFormat:@"%.1fkm", iDistance/1000.0f];
        }
    }else{}
    return distanceStr;
}

// 统一生产UIFont
+ (UIFont *)createFontWithSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size];
}
+ (UIFont *)createBoldFontWithSize:(CGFloat)size
{
    return [UIFont boldSystemFontOfSize:size];
}

// 十六进制字符串转颜色
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert defaultColor:(UIColor *)defaultClr
{
    APP_ASSERT(StringNotEmpty(stringToConvert));
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    UIColor *defaultColor = defaultClr ?: [UIColor whiteColor];
    
    if ([cString length] < 6)
    {
        return defaultColor;
    }
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return defaultColor;
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}




















@end
