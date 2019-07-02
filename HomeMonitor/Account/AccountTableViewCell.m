//
//  accountTableViewCell.m
//  HomeMonitor
//
//  Created by zhj on 2019/6/28.
//  Copyright © 2019 zhj. All rights reserved.
//

#import "AccountTableViewCell.h"
#import "CellColor.h"

@implementation AccountTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupCellItem:(UIColor *)color {
    self.colorView.backgroundColor = color;
}

@end
