//
//  accountTableViewCell.h
//  HomeMonitor
//
//  Created by zhj on 2019/6/28.
//  Copyright © 2019 zhj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *const AccountTableViewCellIdentifier = @"ArrowTableViewCell";

@interface accountTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *colorView;

- (void)setupCellItem:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
