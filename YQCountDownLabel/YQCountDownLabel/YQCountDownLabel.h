//
//  YQCountDownLabel.h
//  ParkingWe
//
//  Created by 杨清 on 2017/8/24.
//  Copyright © 2017年 soargift.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YQCountDownLabel : UILabel

@property (copy, nonatomic) void (^timerEndBlock)();


- (instancetype)initWithFrame:(CGRect)frame completeBlock:(void (^)())completeBlock;

- (instancetype)initWithFrame:(CGRect)frame prefixText:(NSString *)prefixText suffixText:(NSString *)suffixText completeBlock:(void (^)())completeBlock;

#pragma mark - setter getter
/**
 * 获得当前倒计时的秒数
 */
- (NSInteger)seconds;

/**
 * 设置倒计时时间,并启动定时器
 */
- (void)setSeconds:(NSInteger)seconds;


@end
