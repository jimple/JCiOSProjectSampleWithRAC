//
//  SliderViewController.h
//  LeftRightSlider
//
//  Created by Zhao Yiqi on 13-11-27.
//  Copyright (c) 2013年 Zhao Yiqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderViewController : UIViewController

@property (nonatomic, copy) NSString *mainVCClassName;
@property (nonatomic, copy) NSString *mainVCStoryboardID;
@property (nonatomic, copy) NSString *mainVCStoryboardName;

@property(nonatomic,strong)UIViewController *LeftVC;
@property(nonatomic,strong)UIViewController *RightVC;
@property(nonatomic,strong)UIViewController *MainVC;

@property(nonatomic,assign)float LeftSContentOffset;
@property(nonatomic,assign)float RightSContentOffset;

@property(nonatomic,assign)float LeftSContentScale;
@property(nonatomic,assign)float RightSContentScale;

@property(nonatomic,assign)float LeftSJudgeOffset;
@property(nonatomic,assign)float RightSJudgeOffset;

@property(nonatomic,assign)float LeftSOpenDuration;
@property(nonatomic,assign)float RightSOpenDuration;

@property(nonatomic,assign)float LeftSCloseDuration;
@property(nonatomic,assign)float RightSCloseDuration;

@property (nonatomic, assign) BOOL showShadow;
@property(nonatomic,assign)float blackCoverViewAlphaMax;

@property (nonatomic, strong) NSNumber *showLeftSlide;

- (void)initDefaultProperty;
- (void)showContentControllerWithModel:(NSString*)className;
- (void)showContentControllerWithStoryboardID:(NSString*)storyboardID inStoryboard:(NSString *)storyboardName;
- (void)leftItemClick;
- (void)rightItemClick;


- (void)moveViewWithGesture:(UIPanGestureRecognizer *)panGes;

- (void)canMoveWithGesture:(BOOL)canMove;

@end
