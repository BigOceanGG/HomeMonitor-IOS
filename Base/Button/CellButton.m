//
//  CellButton.m
//  HomeMonitor
//
//  Created by zhj on 2019/6/26.
//  Copyright © 2019 zhj. All rights reserved.
//

#import "CellButton.h"
#import "CellColor.h"

@implementation CellButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self themeInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self themeInit];
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        [self themeInit];
    }
    return self;
}

- (void)themeInit {
    [self updateShowStyle];
}

- (void)updateShowStyle {
    if(_secondTheme){
        self.backgroundColor = CellColor.orangeColor;
        self.tintColor = UIColor.whiteColor;
        [self setTitleColor:UIColor.whiteColor forState:UIControlStateDisabled];
        self.layer.borderWidth = 0.f;
    } else {
        self.backgroundColor = CellColor.whiteColor;
        self.tintColor = UIColor.orangeColor;
        [self setTitleColor:UIColor.orangeColor forState:UIControlStateDisabled];
        self.layer.borderWidth = 1.f;
        self.layer.borderColor = CellColor.borderColor.CGColor;
    }
}

- (void)setSecondTheme:(BOOL)secondTheme {
    _secondTheme = secondTheme;
    [self updateShowStyle];
}

@end
