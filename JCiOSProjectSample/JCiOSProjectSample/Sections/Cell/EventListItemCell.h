//
//  EventListItemCell.h
//  JCiOSProjectSample
//
//  Created by jimple on 14/7/7.
//  Copyright (c) 2014年 JimpleChen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EventListItemCellViewModel;
@interface EventListItemCell : UITableViewCell

+ (EventListItemCell *)cellFromXib;
+ (CGFloat)cellHeight;

- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view;

- (void)showWithViewModel:(EventListItemCellViewModel *)viewModel;


@end
