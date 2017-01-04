//
//  LEJAppUtil.h
//  SunFlowerProvider
//
//  Created by WeiChengjiong on 7/12/14.
//  Copyright (c) 2014 9Top. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LKObjectUtil : NSObject

/*
 * 是否全是数字
 */
+ (BOOL)validateNumber:(NSString *)number;

/*
 * 手机号是否正确
 */
+ (BOOL)validMobile:(NSString *)mobile;

/*
 判断邮箱是否正确
 */
+ (BOOL)isValidateEmail:(NSString *)Email;

/*
 判断身份证号码格式是否正确
 */
+ (BOOL)validateIdentityCard: (NSString *)identityCard;

/*
 * 返回拉伸的图片
 * 拉伸参数：
 */
+ (UIImage *)resizableImageByName:(NSString *)name;
+ (UIImage *)resizableImageByName:(NSString *)name capInsets:(UIEdgeInsets)capInsets;

/*
 * 全局的Date Formatter
 * 默认的时间格式是：yyyy-MM-dd HH:mm:ss
 */
+ (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format;
+ (NSDateFormatter *)serverDateFormatter;

/*
 * 时间间隔的显示
 */
+ (NSString *)formattedPublishTimeToNow:(NSDate *)fromDate;
+ (NSString *)formattedDeadlineTimeFromNow:(NSDate *)fromDate;
+ (void)setFormattedPublishTimeToNow:(NSDate *)fromDate withBlockAsync:(void(^)(NSString *, NSDictionary *))block;
+ (void)setFormattedPublishTimeToNow:(NSDate *)fromDate withBlockAsync:(void(^)(NSString *, NSDictionary *))block userInfo:(NSDictionary *)userInfo;
+ (void)setFormattedDeadlineTimeFromNow:(NSDate *)fromDate withBlockAsync:(void(^)(NSString *))block;
+ (NSDateFormatter *)dateFormatter4;
+ (NSDateFormatter *)dateFormatter3;
+ (NSDateFormatter *)dateFormatter5;
+ (NSDateFormatter *)dateFormatter6;
+ (NSDateFormatter *)dateFormatter7;
+ (NSDateComponents*)getYearDay:(NSDate*)date;////获取当前时间的年月日时分秒
//获取星期几
+ (NSDateComponents*)getWeekDay:(NSDate*)dateTime;


+ (void)changeTheNavgationStyle:(UIViewController *)controller
                     titleColor:(UIColor*)color
                   barTintColor:(UIColor*)tinColor;

/*
 *通过字体和内容计算label的宽度
 */
+(float)adjustWidths:(UIFont*)font content:(NSString*)content;
/*
 *通过字体和内容计算label的高度
 */
+(float)adjustHeight:(UIFont*)font content:(NSString*)content;
//forbid emoil face
+ (NSString *)disable_emoji:(NSString *)text;
//判断NSString字符串是否包含emoji表情

+ (BOOL)stringContainsEmoji:(NSString *)string;

/*
 * 获取设备的Ip地址
 * preferIPv4 是否为IPV4
 */
+ (NSString *)getIPAddress:(BOOL)preferIPv4;

//获取字符长度
+ (int)convertToByte:(NSString*)str;
@end