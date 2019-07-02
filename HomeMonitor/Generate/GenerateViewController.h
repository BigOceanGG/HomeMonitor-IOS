//
//  generateViewController.h
//  HomeMonitor
//
//  Created by zhj on 2019/6/26.
//  Copyright © 2019 zhj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface GenerateViewController : UIViewController
@property (weak, nonatomic) IBOutlet CellButton *createUser;
@property (weak, nonatomic) IBOutlet CellButton *loginUser;

@end

NS_ASSUME_NONNULL_END
