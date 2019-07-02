//
//  sceneHeadView.m
//  HomeMonitor
//
//  Created by zhj on 2019/6/30.
//  Copyright © 2019 zhj. All rights reserved.
//

#import "sceneHeadView.h"
#import "CellColor.h"

@implementation sceneHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithSelectedBlock:(void (^)(NSInteger, NSInteger))selectedBlock {
    self = [[[UINib nibWithNibName:@"sceneHeadView" bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
    self.selectedBlock = selectedBlock;
    [self.btn1 setTitle:NSLocalizedString(@"nav.title.summer", nil) forState:UIControlStateNormal];
    [self.btn2 setTitle:NSLocalizedString(@"nav.title.winter", nil) forState:UIControlStateNormal];
    [self.btn1 setTitleColor:CellColor.textColor forState:UIControlStateNormal];
    [self.btn2 setTitleColor:CellColor.textColor forState:UIControlStateNormal];
    [self.btn1 setTitleColor:CellColor.orangeColor forState:UIControlStateSelected];
    [self.btn2 setTitleColor:CellColor.blueColor forState:UIControlStateSelected];
    self.btn1.selected = YES;
    self.bottomLineView.backgroundColor = CellColor.orangeColor;
    
    return self;
}

- (IBAction)btnClick:(UIButton *)sender {
    if (sender.tag == self.currentIndex) {
        return;
    }
    if (self.selectedBlock) {
        self.selectedBlock(self.currentIndex, sender.tag);
    }
    self.currentIndex = sender.tag;
}

- (void)setCurrentIndex:(NSInteger)currentIndex {
    if (_currentIndex == currentIndex) {
        return;
    }
    _currentIndex = currentIndex;
    switch (_currentIndex) {
        case 0: {
            self.btn1.selected = YES;
            self.btn2.selected = NO;
            [UIView animateWithDuration:0.3 animations:^{
                self.bottomLineView.transform = CGAffineTransformIdentity;
                self.bottomLineView.backgroundColor = CellColor.orangeColor;
            }];
        } break;
        case 1: {
            self.btn1.selected = NO;
            self.btn2.selected = YES;
            [UIView animateWithDuration:0.3 animations:^{
                self.bottomLineView.transform = CGAffineTransformMakeTranslation(self.btn2.center.x - self.btn1.center.x, 0);
                self.bottomLineView.backgroundColor = CellColor.blueColor;
            }];
        } break;
    }
}

@end
