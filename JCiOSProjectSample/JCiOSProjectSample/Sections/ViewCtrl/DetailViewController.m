//
//  DetailViewController.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/8.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "DetailViewController.h"
#import "EventDetailViewModel.h"

@interface DetailViewController ()

@property (nonatomic, copy) NSString *eventID;
@property (nonatomic, strong) EventDetailViewModel *viewModel;


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
    [self bindHandler];
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
    
}

- (void)bindHandler
{
    
}



























@end
