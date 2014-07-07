//
//  EventListViewController.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "EventListViewController.h"
#import "EventListViewModel.h"

@interface EventListViewController ()
<
    UITableViewDataSource,
    UITableViewDelegate
>

@property (nonatomic, weak) IBOutlet UITableView *eventTableView;
@property (nonatomic, strong) EventListViewModel *viewModel;


@end

@implementation EventListViewController

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
    
    _viewModel = [[EventListViewModel alloc] init];
    
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

- (void)initUI
{
    
}

- (void)bindHandler
{
    self.eventTableView.delegate = self;
    self.eventTableView.dataSource = self;
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_viewModel itemCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"EventListTableCell";
//    EventListTableCell *cell = (EventListTableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (!cell)
//    {
//        cell = [EventListTableCell cellFromXib];
//    }else{}
//    
//    EventListInfoModel *itemInfo = [_svrDataHelper.tableDataArray objectAtIndex:indexPath.row];
//    CGFloat lat = 0.0f;
//    CGFloat lng = 0.0f;
//    //    // 仅walk in即兴参与显示距离
//    //    if (kEEventListType_WalkIn == _eListType)
//    //    {
//    lat = [itemInfo.lat floatValue];
//    lng = [itemInfo.lng floatValue];
//    //    }else{}
//    [cell setPosterImgURL:itemInfo.hPosterURL
//                    title:itemInfo.title
//                    price:itemInfo.price
//                   vPirce:itemInfo.vPrice
//                      lat:lat
//                      lng:lng
//                labelType:[itemInfo.eLabelType integerValue]
//                startDate:itemInfo.startTime
//                  endDate:itemInfo.endTime
//     showWalkinCellLayout:(kEEventListType_WalkIn == _eListType)];
//    
//    // 滚动到最后时自定加载更多
//    if (![_svrDataHelper.isNoMore boolValue]
//        && (indexPath.row >= _svrDataHelper.tableDataArray.count - 2)
//        && ![self.tableView isLoading])
//    {
//        [self.tableView triggerLoadMoreIndicator];
//    }else{}
//    
//    return cell;
    
    return nil;
}

#pragma mark - Table view delegate
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return [EventListTableCell cellHeight];
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

#pragma mark - Scroll View Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    if (scrollView == self.tableView)
//    {
//        // Get visible cells on table view.
//        NSArray *visibleCells = [self.tableView visibleCells];
//        for (EventListTableCell *cell in visibleCells)
//        {
//            [cell cellOnTableView:self.tableView didScrollOnView:self.view];
//        }
//    }
}



































@end
