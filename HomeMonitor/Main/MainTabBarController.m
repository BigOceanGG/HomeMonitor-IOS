//
//  mainTabBarController.m
//  HomeMonitor
//
//  Created by zhj on 2019/6/27.
//  Copyright © 2019 zhj. All rights reserved.
//

#import "MainTabBarController.h"
#import "CellColor.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTabBar];
}

- (void)setupTabBar {
    self.tabBar.translucent = NO;
    self.tabBar.tintColor = CellColor.tabbarTintColor;
    self.tabBar.shadowImage = UIImage.new;
    
    self.tabBar.layer.shadowColor = UIColor.blackColor.CGColor;
    self.tabBar.layer.shadowOffset = CGSizeMake(0, -4.f);
    self.tabBar.layer.shadowRadius = 12.f;
    self.tabBar.layer.shadowOpacity = 0.1f;
    
    for (int i = 0; i < self.viewControllers.count ; i++) {
        UITabBarItem *item = [self.viewControllers[i] tabBarItem];
        [item setTitlePositionAdjustment:UIOffsetMake(0, -3)];
        NSString *key = [NSString stringWithFormat:@"tabbar_name_%d", i];
        [item setTitle:NSLocalizedString(key, nil)];
    }
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
