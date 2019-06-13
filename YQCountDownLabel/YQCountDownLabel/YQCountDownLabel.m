//
//  YQCountDownLabel.m
//  ParkingWe
//
//  Created by 杨清 on 2017/8/24.
//  Copyright © 2017年 soargift.com. All rights reserved.
//

#import "YQCountDownLabel.h"

@implementation YQCountDownLabel
{
    NSInteger _seconds;
    NSTimer *_timer;
    NSString *_prefixText;
    NSString *_suffixText;
}

- (instancetype)initWithFrame:(CGRect)frame completeBlock:(void (^)())completeBlock
{
    self = [self initWithFrame:frame];
    if (self) {
        self.timerEndBlock = completeBlock;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame prefixText:(NSString *)prefixText suffixText:(NSString *)suffixText completeBlock:(void (^)())completeBlock
{
    self = [self initWithFrame:frame];
    if (self) {
        _prefixText = prefixText;
        _suffixText = suffixText;
        self.timerEndBlock = completeBlock;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - setter getter
- (NSInteger)seconds
{
    return _seconds;
}

- (void)setSeconds:(NSInteger)seconds
{
    if (seconds < 0) {
        return;
    }
    _seconds = seconds;
    [self startTimer];
}

#pragma mark - Private methods

- (void)startTimer
{
    if (_timer != nil) {
        [_timer invalidate];
        _timer = nil;
    }
    
    _timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerTask) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer
{
    if (_timer != nil) {
        [_timer invalidate];
        _timer = nil;
    }
}


- (void)timerTask
{
    NSLog(@"count down = %zi",_seconds);
    if (_seconds <= 0) {
        [self stopTimer];
        NSString *text = @"";
        if (_prefixText) {
            text = [text stringByAppendingString:_prefixText];
        }
        text = [text stringByAppendingString:@"00:00"];
        if (_suffixText) {
            text = [text stringByAppendingString:_suffixText];
        }
        self.text = text;
        if (self.timerEndBlock) {
            self.timerEndBlock();
        }
        return;
    }
    _seconds--;
    NSString *text = @"";
    if (_prefixText) {
        text = [text stringByAppendingString:_prefixText];
    }
    text = [text stringByAppendingString:[NSString stringWithFormat:@"%02.0f:%02zi",floor(_seconds/60.0),_seconds%60]];
    if (_suffixText) {
        text = [text stringByAppendingString:_suffixText];
    }
    self.text = text;
}


- (void)dealloc
{
    [self stopTimer];
}

@end
