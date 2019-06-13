//
//  ViewController.m
//  YQCountDownLabel
//
//  Created by 杨清 on 2019/6/13.
//  Copyright © 2019 QuinceyYang. All rights reserved.
//

#import "ViewController.h"
#import "YQCountDownLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 240, 70)];
    btn.layer.cornerRadius = 6;
    btn.layer.masksToBounds = YES;
    btn.backgroundColor = UIColor.greenColor;
    [btn setTitle:@"YQCountDownLabel show" forState:UIControlStateNormal];
    //btn.center = self.view.center;
    [btn addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

#pragma mark - actions
- (void)tapButton:(UIButton *)sender {
    //__weak __typeof(self)weakSelf = self;
    UIView *view = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    [self.view.window addSubview:view];
    
    YQCountDownLabel *countDownLab = [[YQCountDownLabel alloc]initWithFrame:CGRectMake(0, 0, 120, 50) completeBlock:^{
        //
        [view removeFromSuperview];
    }];
    countDownLab.layer.cornerRadius = countDownLab.frame.size.height/2;
    countDownLab.layer.masksToBounds = YES;
    countDownLab.backgroundColor = UIColor.redColor;
    countDownLab.textAlignment = NSTextAlignmentCenter;
    countDownLab.textColor = UIColor.whiteColor;
    countDownLab.font = [UIFont boldSystemFontOfSize:23];
    countDownLab.center = CGPointMake(view.frame.size.width/2, view.frame.size.height/2);
    [countDownLab setSeconds:4];
    [view addSubview:countDownLab];
}
@end
