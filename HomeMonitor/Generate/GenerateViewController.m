//
//  generateViewController.m
//  HomeMonitor
//
//  Created by zhj on 2019/6/26.
//  Copyright © 2019 zhj. All rights reserved.
//

#import "generateViewController.h"

@interface generateViewController ()

@end

@implementation generateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.createUser setTitle:NSLocalizedString(@"generate_createuser", nil) forState:UIControlStateNormal];
    [self.loginUser setTitle:NSLocalizedString(@"generate_login", nil) forState:UIControlStateNormal];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
