//
//  EventListViewController.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "EventListViewController.h"
#import "EventListViewModel.h"
#import "EventListItemCell.h"
#import "UIScrollView+UzysCircularProgressPullToRefresh.h"
#import "UIScrollView+JCLoadMoreIndicator.h"

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
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)bindHandler
{
    self.eventTableView.delegate = self;
    self.eventTableView.dataSource = self;
    
    [self bindViewModelDataHandler];
    [self bindPullToRefreshAndLoadMoreHandler];
}

- (UITableView *)tableView
{
    return _eventTableView;
}

- (void)resetPullHeaderAndFooterViewOriginalPos
{
    self.tableView.pullToRefreshView.originalTopInset = self.tableView.contentInset.top;
    self.tableView.loadMoreView.originalBottomInset = self.tableView.contentInset.bottom;
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
    static NSString *CellIdentifier = @"EventListItemCell";
    EventListItemCell *cell = (EventListItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = [EventListItemCell cellFromXib];
    }else{}

    EventListItemCellViewModel *cellViewModel = [_viewModel cellViewModelAtIndex:indexPath.row];
    [cell showWithViewModel:cellViewModel];
    
    // 滚动到最后时自定加载更多
    if (![_viewModel.isNoMore boolValue]
        && (indexPath.row >= (_viewModel.itemCount - 2))
        && ![self.tableView isLoading])
    {
        [self.tableView triggerLoadMoreIndicator];
    }else{}
    
    return cell;
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [EventListItemCell cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

#pragma mark - Scroll View Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.tableView)
    {
        // 显示cell图片视差效果
        NSArray *visibleCells = [self.tableView visibleCells];
        for (EventListItemCell *cell in visibleCells)
        {
            [cell cellOnTableView:self.tableView didScrollOnView:self.view];
        }
    }else{}
}

#pragma mark -
- (void)bindPullToRefreshAndLoadMoreHandler
{
    @weakify(self);
    [self.tableView addPullToRefreshActionHandler:^{
        @strongify(self);
        [self.viewModel refreshList];
        [self.tableView reloadData];
    }];
    
    [self.tableView addLoadMoreActionHandler:^{
        @strongify(self);
        [self.viewModel loadMore];
    }];
}

- (void)bindViewModelDataHandler
{
    // init property handler
    @weakify(self);
    [[[RACObserve(self.viewModel, isNoMore) ignore:nil] deliverOn:RACScheduler.mainThreadScheduler]
     subscribeNext:^(NSNumber *isNoMore) {
         @strongify(self);
         if ([isNoMore boolValue])
         {
             [self.tableView stopRefreshAnimation];
             [self.tableView stopLoadMoreIndicator];
         }
         else
         {
         }
     }];
    
    [[[RACObserve(self.viewModel, appendItemCount) ignore:nil] deliverOn:RACScheduler.mainThreadScheduler]
     subscribeNext:^(NSNumber *appendItemCount) {
         @strongify(self);
         [self.tableView stopRefreshAnimation];
         [self.tableView stopLoadMoreIndicator];
         if (appendItemCount.integerValue > 0)
         {
             [self.tableView beginUpdates];
             NSInteger startInsertPos = self.viewModel.itemCount - appendItemCount.integerValue;
             NSMutableArray *arrRowsAdd = [[NSMutableArray alloc] init];
             for (int i = 0; i < appendItemCount.integerValue; i++)
             {
                 NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(startInsertPos+i) inSection:0];
                 [arrRowsAdd addObject:indexPath];
             }
             [self.tableView insertRowsAtIndexPaths:arrRowsAdd withRowAnimation:UITableViewRowAnimationNone];
             [self.tableView endUpdates];
         }else{}
     }];
    
    [[[RACObserve(self.viewModel, requestError) ignore:nil] deliverOn:RACScheduler.mainThreadScheduler]
     subscribeNext:^(NSError *error) {
         @strongify(self);
         [self.tableView stopRefreshAnimation];
         [self.tableView stopLoadMoreIndicator];
         
         // ... show error
     }];
}































@end
