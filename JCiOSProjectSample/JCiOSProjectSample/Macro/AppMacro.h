//
//  AppMacro.h
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/6.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#ifndef JCiOSProjectSample_AppMacro_h
#define JCiOSProjectSample_AppMacro_h



///////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - 代码简写

#define AppVersionNumber                        [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define AppName                                 [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleNameKey]
#define DeviceName                              [[UIDevice currentDevice] name]
#define DeviceModel                             [[UIDevice currentDevice] systemName]
#define DeviceVersion                           [[UIDevice currentDevice] systemVersion]
#define URLFromString(str)                      [NSURL URLWithString:str]
#define InstantiateVCFromStoryboard(storyboardName, VCID)       [[UIStoryboard storyboardWithName:storyboardName bundle:nil] instantiateViewControllerWithIdentifier:VCID];

#define Is4Inch                                 [UtilityFunc is4InchScreen]





///////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Storyboard名

#define MainStoryboard                          @"Main"
#define OtherMainStoryboard                     @"OtherMain"
#define FirstFlowStoryboard                     @"FirstFlow"
#define SecondFlowStoryboard                    @"SecondFlow"


///////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - 界面有关的宏


#define COLOR_AppWhite                          RGB(253.0f, 253.0f, 253.0f)
#define COLOR_ViewBg                            RGB(236.0f, 239.0f, 240.0f)
#define COLOR_LightViewBg                       RGB(241.0f, 244.0f, 245.0f)

#define COLOR_TextDark                          RGB(5.0f, 5.0f, 5.0f)
#define COLOR_TextLightDark                     RGB(30.0f, 30.0f, 30.0f)
#define COLOR_TextDarkGray                      RGB(89.0f, 99.0f, 113.0f)
#define COLOR_TextGray                          RGB(113.0f, 112.0f, 113.0f)
#define COLOR_TextMidLightGray                  RGB(126.0f, 139.0f, 139.0f)
#define COLOR_TextLightGray                     RGB(140.0f, 140.0f, 140.0f)
#define COLOR_TextGreen                         RGB(81.0f, 181.0f, 123.0f)
#define COLOR_TextRed                           RGB(240.0f, 0.0f, 0.0f)
#define COLOR_TextDarkRed                       RGB(183.0f, 57.0f, 43.0f)
#define COLOR_TextAppOrange                     RGB(224.0f, 83.0f, 51.0f)
#define COLOR_TextOrange                        RGB(245.0f, 91.0f, 26.0f)
#define COLOR_BtnLightGray                      RGB(235.0f, 235.0f, 235.0f)
#define COLOR_BtnGray                           RGB(120.0f, 120.0f, 120.0f)
#define COLOR_BtnOrange                         RGB(245.0f, 91.0f, 26.0f)
#define COLOR_BtnGreen                          RGB(62.0f, 160.0f, 68.0f)
#define COLOR_BtnRed                            RGB(193.0f, 57.0f, 43.0f)
#define COLOR_BtnLightGreen                     RGB(82.0f, 190.0f, 128.0f)
#define COLOR_PopupCardBg                       RGB(245.0f, 245.0f, 245.0f)
#define COLOR_PopupCardBgDark                   RGB(230.0f, 230.0f, 230.0f)
#define COLOR_PopupCardTitleBg                  RGB(220.0f, 220.0f, 220.0f)
#define COLOR_PopupCardTitleLine                RGB(150.0f, 150.0f, 150.0f)
#define COLOR_BgGreen                           RGB(81.0f, 181.0f, 123.0f)
#define COLOR_BgLightGray                       RGB(236.0f, 239.0f, 240.0f)
#define COLOR_BgOrange                          RGB(223.0f, 141.0f, 57.0f)


#define SIZE_TextSmall                          10.0f
#define SIZE_TextContentNormal                  13.0f
#define SIZE_TextTitleMini                      15.0f
#define SIZE_TextTitleNormal                    17.0f
#define SIZE_TextTitleLarge                     20.0f
#define SIZE_TextLarge                          16.0f
#define SIZE_TextHuge                           18.0f

#define FLOAT_CornerRadius                      4.0f





























#endif
