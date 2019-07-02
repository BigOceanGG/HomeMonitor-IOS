//
//  CellTextField.m
//  HomeMonitor
//
//  Created by zhj on 2019/6/27.
//  Copyright © 2019 zhj. All rights reserved.
//

#import "CellTextField.h"
#import "CellColor.h"

@implementation CellTextField

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
    self.textColor = CellColor.grayColor;
    self.tintColor = CellColor.grayColor;
    self.keyboardAppearance = UIKeyboardAppearanceDark;
}

- (void)setPlaceholder:(NSString *)placeholder {
    [super setPlaceholder:placeholder];
    if (placeholder.length) {
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder
                                                                     attributes:@{NSFontAttributeName : self.font,
                                                                                  NSForegroundColorAttributeName : CellColor.placeholderColor}];;
    }
}

@end
