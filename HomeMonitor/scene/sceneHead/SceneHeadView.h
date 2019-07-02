//
//  sceneHeadView.h
//  HomeMonitor
//
//  Created by zhj on 2019/6/30.
//  Copyright © 2019 zhj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface sceneHeadView : UIView
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIView *bottomLineView;

@property (nonatomic, strong) void(^selectedBlock)(NSInteger, NSInteger);

- (instancetype)initWithSelectedBlock:(void(^)(NSInteger oldIndex, NSInteger newIndex))selectedBlock;

@property (nonatomic, assign) NSInteger currentIndex;

@end

NS_ASSUME_NONNULL_END
