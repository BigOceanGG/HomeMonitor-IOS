//
//  VNavigationController.m
//  Wallet
//
//  All rights reserved.
//

#import "CellNavigationController.h"
#import "UIImage+Color.h"
#import "CellColor.h"
#import "NaviView.h"

@interface CellNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation CellNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
}

- (void)setupNavigationBar {
    self.navigationBar.shadowImage = UIImage.new;
    self.navigationBar.translucent = NO;
    self.colorStyle = self.colorStyle;
    
    [UINavigationBar appearance].backIndicatorTransitionMaskImage = [UIImage imageNamed:@"back"];
    [UINavigationBar appearance].backIndicatorImage = [UIImage imageNamed:@"back"];
    
    [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[self.class]]
     setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16.f], NSForegroundColorAttributeName : CellColor.orangeColor}
     forState:UIControlStateNormal];
    [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[self.class]]
     setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16.f], NSForegroundColorAttributeName : CellColor.orangeColor}
     forState:UIControlStateHighlighted];
    [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[self.class]]
     setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16.f], NSForegroundColorAttributeName : CellColor.textColor}
     forState:UIControlStateDisabled];
    
    self.interactivePopGestureRecognizer.delegate = self;
}

- (void)setColorStyle:(int)colorStyle {
    _colorStyle = abs(colorStyle) % 3;
    switch (_colorStyle) {
        case 0:
            [self changeToWhiteNavigationBar];
            break;
        case 1:
            [self changeToGrayNavigationBar];
            break;
        case 2:
            [self changeToThemeNavigationBar];
            break;
    }
}

- (void)changeToWhiteNavigationBar {
    UIApplication.sharedApplication.statusBarStyle = UIStatusBarStyleDefault;
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : CellColor.textColor};
    self.navigationBar.tintColor = CellColor.orangeColor;
    self.navigationBar.backgroundColor = UIColor.whiteColor;
    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:UIColor.whiteColor] forBarMetrics:UIBarMetricsDefault];
}

- (void)changeToGrayNavigationBar {
    UIApplication.sharedApplication.statusBarStyle = UIStatusBarStyleDefault;
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : CellColor.blueColor};
    self.navigationBar.tintColor = CellColor.blueColor;
    self.navigationBar.backgroundColor = CellColor.blueColor;
    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:CellColor.blueColor] forBarMetrics:UIBarMetricsDefault];
}

- (void)changeToThemeNavigationBar {
    UIApplication.sharedApplication.statusBarStyle = UIStatusBarStyleLightContent;
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : UIColor.whiteColor};
    self.navigationBar.tintColor = UIColor.whiteColor;
    self.navigationBar.backgroundColor = CellColor.borderColor;
    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:CellColor.borderColor] forBarMetrics:UIBarMetricsDefault];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.hidesBottomBarWhenPushed = self.viewControllers.count;
    self.viewControllers.lastObject.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [super pushViewController:viewController animated:animated];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return [self.viewControllers count] > 1;
}

@end
