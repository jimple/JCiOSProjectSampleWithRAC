//
//  EventListItemCell.m
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import "EventListItemCell.h"
#import "EventListItemCellViewModel.h"
#import "UIImageView+WebCache.h"

@interface EventListItemCell ()

@property (nonatomic, weak) IBOutlet UIView *imgPanel;
@property (nonatomic, weak) IBOutlet UIImageView *imgView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@property (nonatomic, strong) EventListItemCellViewModel *cellViewModel;

@end

@implementation EventListItemCell

+ (EventListItemCell *)cellFromXib
{
    EventListItemCell *cell;
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"EventListItemCell" owner:self options:nil];
    APP_ASSERT(nib && nib.count > 0)
    cell = (EventListItemCell *)[nib objectAtIndex:0];
    
    return cell;
}

+ (CGFloat)cellHeight
{
    return 100.0f;
}

- (void)awakeFromNib
{
    // Initialization code
    self.titleLabel.backgroundColor = RGBA(20.0f, 20.0f, 20.0f, 0.6f);
    self.imgPanel.clipsToBounds = YES;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.imgView.image = nil;
    self.titleLabel.text = @"";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view
{
    [UtilityFunc cell:self onTableView:tableView didScrollOnView:view parallaxImgView:self.imgView];
}

- (void)showWithViewModel:(EventListItemCellViewModel *)viewModel
{
    APP_ASSERT(viewModel);
    _cellViewModel = viewModel;
    
    if (_cellViewModel)
    {
        [self.imgView setImageWithURL:URLFromString(_cellViewModel.imageURL) placeholderImage:nil];
        self.titleLabel.text = [_cellViewModel.title copy];
    }else{}
}

#pragma mark -
































@end
