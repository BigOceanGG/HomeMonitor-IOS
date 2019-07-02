//
//  loginViewController.h
//  HomeMonitor
//
//  Created by zhj on 2019/6/26.
//  Copyright © 2019 zhj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellTextField.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet CellTextField *passwordText;

@end

NS_ASSUME_NONNULL_END
