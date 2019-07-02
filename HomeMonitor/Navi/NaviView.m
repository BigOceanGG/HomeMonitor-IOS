//
//  NaviView.m
//  HomeMonitor
//
//  Created by zhj on 2019/7/2.
//  Copyright © 2019 zhj. All rights reserved.
//

#import "NaviView.h"

@implementation NaviView



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithType :(NSString *)title
                         back:(void(^)(void)) back {
    self = [[[UINib nibWithNibName:@"NaviView" bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
    self.backCallback = back;
    self.titleLabel.text = title;
    return self;
}
- (IBAction)backClick:(id)sender {
    if (self.backCallback) {
        self.backCallback();
    }
}

@end
