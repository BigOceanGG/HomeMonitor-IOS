//
//  scenePageViewController.m
//  HomeMonitor
//
//  Created by zhj on 2019/6/28.
//  Copyright © 2019 zhj. All rights reserved.
//

#import "scenePageViewController.h"
#import "sceneHeadView.h"
#import "accountTableViewController.h"

@interface scenePageViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic, strong) sceneHeadView *headView;

@property (nonatomic, strong) NSArray *childVCArray;

@property (nonatomic, weak) UIViewController *pendingViewController;

@end

@implementation scenePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)initView {
    self.headView = [[sceneHeadView alloc] initWithSelectedBlock:^(NSInteger oldIndex, NSInteger newIndex) {
        if (newIndex >= 0 && newIndex < self.childVCArray.count) {
            self.view.userInteractionEnabled = NO;
            [self setViewControllers:@[self.childVCArray[newIndex]]
                               direction:(newIndex > oldIndex ? UIPageViewControllerNavigationDirectionForward : UIPageViewControllerNavigationDirectionReverse)
                                animated:YES
                              completion:^(BOOL finished) {
                                  self.view.userInteractionEnabled = finished;
                              }];
        }
    }];

    self.dataSource = self;
    self.delegate = self;
    
    self.navigationItem.titleView = self.headView;
    self.childVCArray = @[[[accountTableViewController alloc]initWithAccountType : AccountTypeSummer],
                          [[accountTableViewController alloc]initWithAccountType : AccountTypeWinter]];
    [self setViewControllers:@[self.childVCArray.firstObject] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //[self changeToWhiteNavigationBar];
}

#pragma mark - UIPageViewController DataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    if (self.headView.currentIndex < self.childVCArray.count - 1) {
        return self.childVCArray[self.headView.currentIndex + 1];
    }
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if (self.headView.currentIndex > 0) {
        return self.childVCArray[self.headView.currentIndex - 1];
    }
    return nil;
}

#pragma mark - UIPageViewController Delegate
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    self.pendingViewController = pendingViewControllers.firstObject;
    self.view.userInteractionEnabled = NO;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    self.view.userInteractionEnabled = finished;
    if (finished && completed && self.pendingViewController != previousViewControllers.firstObject) {
        self.headView.currentIndex = [self.childVCArray indexOfObject:self.pendingViewController];
    }
}

@end
