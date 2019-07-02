//
//  settingViewController.m
//  HomeMonitor
//
//  Created by zhj on 2019/7/1.
//  Copyright © 2019 zhj. All rights reserved.
//

#import "SettingViewController.h"
#import "NaviView.h"
#import "WindowManager.h"
#import "CellStoryboard.h"

@interface SettingViewController ()

@property (nonatomic, strong) NaviView *naviView;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.naviView = [[NaviView alloc] initWithType :NSLocalizedString(@"cell.title", nil) back:^{
        [WindowManager changeToRootViewController:CellStoryboard.Generate.instantiateInitialViewController];
    }];
    self.navigationItem.titleView = self.naviView ;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)ViewControllerUnwindSegue:(UIStoryboardSegue *)unwindSegue {
    if ([unwindSegue.identifier isEqualToString:@"testback"]) {

    }
}

@end
