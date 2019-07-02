//
//  CellColor.m
//  HomeMonitor
//
//  Created by zhj on 2019/6/26.
//  Copyright © 2019 zhj. All rights reserved.
//

#import "CellColor.h"
#import "UIColor+Hex.h"


@implementation CellColor

+ (UIColor *)orangeColor {
    return [UIColor colorWithHex:0xFF6565];
}

+ (UIColor *)blueColor {
    return [UIColor colorWithHex:0x0E81FF];
}

+ (UIColor *)borderColor {
    return [UIColor colorWithHex:0xFF6565];
}

+ (UIColor *)whiteColor {
    return [UIColor colorWithHex:0xFFFFFF];
}

+ (UIColor *)placeholderColor {
    return [UIColor colorWithHex:0xAEAEAE];
}

+ (UIColor *)grayColor {
    return [UIColor colorWithHex:0x81818A];
}

+ (UIColor *)tabbarTintColor {
    return [UIColor colorWithHex:0x222222];
}

+ (UIColor *)textColor {
    return [UIColor colorWithHex:0x939399];
}

@end
