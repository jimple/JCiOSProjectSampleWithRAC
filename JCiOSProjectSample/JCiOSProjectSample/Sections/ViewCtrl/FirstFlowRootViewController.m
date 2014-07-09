//
//  FirstFlowRootViewController.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "FirstFlowRootViewController.h"
#import "EventListViewController.h"

@interface FirstFlowRootViewController ()

@property (nonatomic, strong) EventListViewController *eventListVC;


@end

@implementation FirstFlowRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
    
    [_eventListVC forceRefreshList];
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

- (void)initUI
{
    [self setTitle:LOCALIZATION(@"FirstFlowRootViewTitle")];
    
    _eventListVC = (EventListViewController *)[UtilityFunc viewCtrlFormStoryboard:FirstFlowStoryboard viewCtrlID:@"EventListViewController"];
    _eventListVC.view.frame = self.view.bounds;
    
    [self.view addSubview:_eventListVC.view];
    [self addChildViewController:_eventListVC];
    
    // tableview内容区域和滚动条位置减掉status bar＋navigation bar的高度
    [UtilityFunc resetScrlView:_eventListVC.tableView contentInsetWithNaviBar:YES tabBar:NO];
    
    // tableView的inset调整后需重设下拉刷新头的原始位置，否则下拉刷新结束回复原始位置时会恢复到调整前的位置
    [_eventListVC resetPullHeaderAndFooterViewOriginalPos];  
}






























@end
