//
//  DetailViewController.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/8.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "DetailViewController.h"
#import "EventDetailViewModel.h"
#import "MBProgressHUD+creator.h"
#import "SGInfoAlert+ShowAlert.h"

@interface DetailViewController ()

@property (nonatomic, weak) IBOutlet UILabel *descLabel;
@property (nonatomic, weak) IBOutlet UIButton *getMoreDataBtn;
@property (nonatomic, weak) IBOutlet UILabel *moreInfoLabel;

@property (nonatomic, copy) NSString *eventID;
@property (nonatomic, strong) EventDetailViewModel *viewModel;
@property (nonatomic, strong) MBProgressHUD *loadingIndicator;

@end

@implementation DetailViewController

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
    
    APP_ASSERT(StringNotEmpty(_eventID));
    
    _viewModel = [[EventDetailViewModel alloc] initWithEventID:_eventID];
    
    [self initUI];
    [self bindWithViewModel];
    
    [self showLoadingIndicator];
    [_viewModel requestDetail];
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

- (void)setEventID:(NSString *)eventID
{
    _eventID = eventID;
}

#pragma mark -
- (void)initUI
{
    self.descLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)bindWithViewModel
{
    RAC(self, title) = RACObserve(self.viewModel, title);
    RAC(self.descLabel, text) = RACObserve(self.viewModel, description);
    RAC(self.moreInfoLabel, text) = RACObserve(self.viewModel, moreInfo);
    
    @weakify(self);
    [[RACObserve(self.viewModel, isRequestFinished) ignore:nil] subscribeNext:^(NSNumber *isFinshed) {
        @strongify(self);
        [self hideLoadingIndicator];
    }];
    
    [[RACObserve(self.viewModel, requestErrMsg) ignore:nil] subscribeNext:^(NSString *errorMsg) {
        @strongify(self);
        [SGInfoAlert showAlert:errorMsg duration:0.6f inView:self.view];
    }];
    
    self.getMoreDataBtn.rac_command = self.viewModel.getMoreDataCommand;
}

- (void)showLoadingIndicator
{
    if (!_loadingIndicator)
    {
        _loadingIndicator = [MBProgressHUD createInViewCtrl:self detailText:@""];
    }else{}
    [_loadingIndicator show:YES];
}

- (void)hideLoadingIndicator
{
    if (_loadingIndicator)
    {
        [_loadingIndicator hide:YES];
        _loadingIndicator = nil;
    }else{}
}


























@end
