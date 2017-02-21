//
//  UIButton+touch.h
//  YueYangLou
//
//  Created by KorzJ on 16/7/16.
//  Copyright © 2016年 KorzJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#define defaultInterval .1  //默认时间间隔
@interface UIButton (touch)

/**设置点击时间间隔*/
@property (nonatomic, assign) NSTimeInterval timeInterval;
/**
 *  用于设置单个按钮不需要被hook
 */
@property (nonatomic, assign) BOOL isIgnore;

/*
 *    倒计时按钮
 *    @param timeLine  倒计时总时间
 *    @param title     还没倒计时的title
 *    @param subTitle  倒计时的子名字 如：时、分
 *    @param mColor    还没倒计时的颜色
 *    @param color     倒计时的颜色
 */

- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color;
@end
