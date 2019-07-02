//
//  accountTableViewController.h
//  HomeMonitor
//
//  Created by zhj on 2019/6/28.
//  Copyright © 2019 zhj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AccountType) {
    AccountTypeSummer = 0,
    AccountTypeWinter
};

NS_ASSUME_NONNULL_BEGIN

@interface accountTableViewController : UITableViewController

- (instancetype)initWithAccountType:(AccountType)walletType;


@end

NS_ASSUME_NONNULL_END
