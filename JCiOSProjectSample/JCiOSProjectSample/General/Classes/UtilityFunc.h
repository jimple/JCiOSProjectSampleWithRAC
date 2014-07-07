//
//  UtilityFunc.h
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UtilityFunc : NSObject

// 是否4英寸屏幕
+ (BOOL)is4InchScreen;

// 获取屏幕宽度/高度
+ (CGFloat)getScreenWidth;
+ (CGFloat)getScreenHeight;

// 日期转字符串
+ (NSString *)getStringFromDate:(NSDate *)date byFormat:(NSString *)strFormat;
// 字符串转日期
+ (NSDate *)getDateFromString:(NSString *)strDate byFormat:(NSString *)strDateFormat;

// label设置最小字体大小
+ (void)label:(UILabel *)label setMiniFontSize:(CGFloat)fMiniSize forNumberOfLines:(NSInteger)iLines;

// 清除PerformRequests和notification
+ (void)cancelPerformRequestAndNotification:(UIViewController *)viewCtrl;

// 重设scroll view的内容区域和滚动条区域
+ (void)resetScrlView:(UIScrollView *)sclView contentInsetWithNaviBar:(BOOL)bHasNaviBar tabBar:(BOOL)bHasTabBar;
+ (void)resetScrlView:(UIScrollView *)sclView contentInsetWithNaviBar:(BOOL)bHasNaviBar tabBar:(BOOL)bHasTabBar iOS7ContentInsetStatusBarHeight:(NSInteger)iContentMulti inidcatorInsetStatusBarHeight:(NSInteger)iIndicatorMulti;
// 按找状态栏高度的倍数来重设scroll view的内容区域和滚动条区域
+ (void)resetScrlView:(UIScrollView *)sclView contentInsetStatusBarTimes:(NSInteger)contentTimes indicatorInsetStatusBarTimes:(NSInteger)indicatorTimes;
// 指定高度重设内容区域和滚动条区域
+ (void)resetScrlView:(UIScrollView *)sclView contentInset:(CGFloat)contentInset indicatorInset:(CGFloat)indicatorInset;

// 从故事版获取VC
+ (id)viewCtrlFormStoryboard:(NSString *)storyboardName viewCtrlID:(NSString *)viewCtrlID;

// 创建UILabel
+ (UILabel *)createLabelWithFrame:(CGRect)rc fontSize:(CGFloat)fFontSize txtColor:(UIColor *)clrTxt;
+ (UILabel *)createLabelWithFrame:(CGRect)rc fontSize:(CGFloat)fFontSize txtColor:(UIColor *)clrTxt isBoldFont:(BOOL)bIsBold;
+ (UILabel *)createLabelWithFrame:(CGRect)rc fontSize:(CGFloat)fFontSize txtColor:(UIColor *)clrTxt isBoldFont:(BOOL)bIsBold txtAlignment:(NSTextAlignment)alignment;

// 心跳动画
+ (void)heartbeatView:(UIView *)view duration:(CGFloat)fDuration;
+ (void)heartbeatView:(UIView *)view duration:(CGFloat)fDuration maxSize:(CGFloat)fMaxSize durationPerBeat:(CGFloat)fDurationPerBeat;

// Table滚动时TableCell内ImageView视差显示
+ (void)cell:(UITableViewCell *)cell onTableView:(UITableView *)tableView didScrollOnView:(UIView *)view parallaxImgView:(UIImageView *)imgView;

// 解析出URL的参数
+ (NSDictionary *)paramFromURL:(NSURL *)URL;

// 创建编辑框
+ (UITextField *)createNormalTextFieldWithFrame:(CGRect)rcFrame placeHolder:(NSString *)strPlaceholder;
+ (UITextField *)createNormalTextFieldWithFrame:(CGRect)rcFrame placeHolder:(NSString *)strPlaceholder keyboardType:(UIKeyboardType)eKeyboardType;

// 下拉选择样式的按钮
+ (void)setDropdownItemBtnStyle:(UIButton *)btn;
+ (void)setDropdownItemBtnStyle:(UIButton *)btn isContentAlignmentLeft:(BOOL)bIsAlignmentLeft;

// 视图添加一个光晕
+ (void)viewShowRedShadow:(UIView *)view;
+ (void)view:(UIView *)view showShadowWithColor:(UIColor *)color;
+ (void)viewRemoveShadow:(UIView *)view;

//获取是否开启推送通知
+ (BOOL)judgeNotification;

// 计算两坐标点间的距离
+ (CGFloat)distanceFromLat:(CGFloat)fromLat lng:(CGFloat)fromLng toLat:(CGFloat)toLat lng:(CGFloat)toLng;
+ (NSString *)distanceStrFromLat:(CGFloat)fromLat lng:(CGFloat)fromLng toLat:(CGFloat)toLat lng:(CGFloat)toLng;

// 统一生产UIFont
+ (UIFont *)createFontWithSize:(CGFloat)size;
+ (UIFont *)createBoldFontWithSize:(CGFloat)size;

// 十六进制字符串转颜色
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert defaultColor:(UIColor *)defaultColor;





@end
