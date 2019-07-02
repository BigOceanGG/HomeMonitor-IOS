//
//  loginViewController.m
//  HomeMonitor
//
//  Created by zhj on 2019/6/26.
//  Copyright © 2019 zhj. All rights reserved.
//

#import "LoginViewController.h"
#import "CellAlertViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoPos;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}

- (void)initView {
    
    self.passwordText.placeholder = NSLocalizedString(@"input_password", nil);
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    return NO;
}

- (IBAction)login:(id)sender {
    if([self.passwordText.text isEqualToString:@"123"]){
        [self performSegueWithIdentifier:@"changeMain" sender:self];
    } else {
        CellAlertViewController *vc = [[CellAlertViewController alloc] initWithTitle:NSLocalizedString(@"cell.warning", nil) secondTitle:@"" contentView:^(UIStackView * _Nonnull view) {
            
        } cancelTitle:NSLocalizedString(@"cell.cancel", nil) confirmTitle:NSLocalizedString(@"cell.confirm", nil) cancel:^{
            
        } confirm:^{
        }];
        [self presentViewController:vc animated:YES completion:nil];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark - keyboard
- (void)keyboardShow:(NSNotification *)notification {
    CGFloat keyboardMinY = CGRectGetMinY([notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue]);
    CGFloat inputViewMaxY = CGRectGetMaxY([self.inputView convertRect:self.inputView.bounds toView:UIApplication.sharedApplication.keyWindow]);
    // 100: distance between logo and top when keyboard hidden
    // 52: max distance between logo and top when keyboard show
    CGFloat offset = MAX((100 - 52), (inputViewMaxY + 20 - keyboardMinY));
    
    NSTimeInterval duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewKeyframeAnimationOptions option = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    __weak typeof(self) weakSelf = self;
    [UIView animateKeyframesWithDuration:duration delay:0 options:option animations:^{
        weakSelf.logoPos.constant = 100 - offset;
        [weakSelf.view layoutIfNeeded];
    } completion:nil];
}

- (void)keyboardHide:(NSNotification *)notification {
    NSTimeInterval duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewKeyframeAnimationOptions option = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    __weak typeof(self) weakSelf = self;
    [UIView animateKeyframesWithDuration:duration delay:0 options:option animations:^{
        weakSelf.logoPos.constant = 100;
        [weakSelf.view layoutIfNeeded];
    } completion:nil];
}


@end
