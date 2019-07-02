//
//  NaviView.h
//  HomeMonitor
//
//  Created by zhj on 2019/7/2.
//  Copyright © 2019 zhj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NaviView : UIView

- (instancetype)initWithType:(NSString *)title
                        back:(void(^)(void))back;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@property (nonatomic, strong) void(^backCallback)(void);

@end

NS_ASSUME_NONNULL_END
