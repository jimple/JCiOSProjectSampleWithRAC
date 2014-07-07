//
//  LeftSideViewController.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "LeftSideViewController.h"
#import "HighlightBgViewButton.h"
#import "LeftSideViewTabHelper.h"

@interface LeftSideViewController ()

@property (nonatomic, weak) IBOutlet UIView *firstFlowItemPanel;
@property (nonatomic, weak) IBOutlet UIImageView *firstFlowIcon;
@property (nonatomic, weak) IBOutlet UILabel *firstFlowLabel;
@property (nonatomic, weak) IBOutlet HighlightBgViewButton *firstFlowBtn;
@property (nonatomic, weak) IBOutlet UIView *secondFlowItemPanel;
@property (nonatomic, weak) IBOutlet UIImageView *secondFlowIcon;
@property (nonatomic, weak) IBOutlet UILabel *secondFlowLabel;
@property (nonatomic, weak) IBOutlet HighlightBgViewButton *secondFlowBtn;




@end

@implementation LeftSideViewController

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
    [self bindBtnHandler];
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
    [self initItemCell];
}

- (void)initItemCell
{
    self.firstFlowIcon.image = [UIImage imageNamed:@"LeftFirstFlow"];
    self.firstFlowLabel.text = LOCALIZATION(@"FirstFlownBtn");
    self.secondFlowIcon.image = [UIImage imageNamed:@"LeftSecondFlow"];
    self.secondFlowLabel.text = LOCALIZATION(@"SecondFlownBtn");
    
    [self.firstFlowBtn initBgView:self.firstFlowItemPanel];
    [self.secondFlowBtn initBgView:self.secondFlowItemPanel];
}

- (void)bindBtnHandler
{
    self.firstFlowBtn.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [[LeftSideViewTabHelper sharedInstance] selectFirstFlowTab];
        return [RACSignal empty];
    }];
    
    self.secondFlowBtn.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [[LeftSideViewTabHelper sharedInstance] selectSecondFlowTab];
        return [RACSignal empty];
    }];
}



















































@end
