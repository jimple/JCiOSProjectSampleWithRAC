//
//  MainSliderViewController.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/6.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "MainSliderViewController.h"

@interface MainSliderViewController ()

@end

@implementation MainSliderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        [self initWhenCreated];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self initWhenCreated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[GlobalObjectManager sharedInstance] saveMainSliderVC:self];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)showContentControllerWithModel:(NSString*)className
{
    [super showContentControllerWithModel:className];
    
    [self mainViewChangedWithClassName:className];
}

- (void)showContentControllerWithStoryboardID:(NSString*)storyboardID inStoryboard:(NSString *)storyboardName
{
    [super showContentControllerWithStoryboardID:storyboardID inStoryboard:storyboardName];
    
    [self mainViewChangedWithClassName:storyboardID];
}

#pragma mark -
- (void)initWhenCreated
{
    [self initDefaultProperty];
    
    self.showShadow = YES;
    self.LeftSContentOffset = 250.0f;
    self.blackCoverViewAlphaMax = 0.1f;
    
    self.mainVCStoryboardID = VCID_FirstFlowNaviCtrl;
    self.mainVCStoryboardName = FirstFlowStoryboard;
    self.LeftVC = InstantiateVCFromStoryboard(MainStoryboard, VCID_LeftSideVC);
    self.LeftSContentScale = 0.9;
}

- (void)mainViewChangedWithClassName:(NSString *)name
{
    if (StringNotEmpty(name))
    {
        if ([name isEqualToString:VCID_FirstFlowNaviCtrl])
        {
            self.eCurrMainViewType = @(kESliderVCMainViewType_FirstFlow);
        }
        else if ([name isEqualToString:VCID_SecondFlowNaviCtrl])
        {
            self.eCurrMainViewType = @(kESliderVCMainViewType_SecondFlow);
        }
        else
        {
            // 新页面需添加类似上面if分支的处理代码
            APP_ASSERT_STOP
        }
    }
    else
    {
        APP_ASSERT_STOP
        self.eCurrMainViewType = @(kESliderVCMainViewType_None);
    }
}
















@end
