//
//  LEJAppUtil.m
//  SunFlowerProvider
//
//  Created by WeiChengjiong on 7/12/14.
//  Copyright (c) 2014 9Top. All rights reserved.
//

#import "LKObjectUtil.h"
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <net/if.h>

#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_VPN         @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"

#define  spm_identifier  @"imagecache"

@implementation LKObjectUtil

+ (BOOL)validateNumber:(NSString *)number
{
    BOOL res = YES;
    NSCharacterSet *tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}

+ (BOOL)validMobile:(NSString *)mobile{
    NSString *mobileRegex = @"^((13[0-9])|(147)|(170)|(15[^4,\\D])|(18[^4]))\\d{8}$";
    NSPredicate *mobileTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",mobileRegex];
    return [mobileTest evaluateWithObject:mobile];
}

+ (BOOL)isValidateEmail:(NSString *)Email
{
    NSString *emailCheck = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailCheck];
    return [emailTest evaluateWithObject:Email];
}


//身份证号
+ (BOOL)validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

+ (UIImage *)resizableImageByName:(NSString *)name
{
    return [self resizableImageByName:name capInsets:UIEdgeInsetsMake(8, 8, 8, 8)];
}

+ (UIImage *)resizableImageByName:(NSString *)name capInsets:(UIEdgeInsets)capInsets
{
    UIImage *image = [UIImage imageNamed:name];
    return [image resizableImageWithCapInsets:capInsets];
}

+ (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = format;
    return dateFormatter;
}

+ (NSDateFormatter *)serverDateFormatter
{
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [self dateFormatterWithFormat:@"yyyy-MM-dd HH:mm:ss"];
        dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    });
    return dateFormatter;
}

+ (NSDateFormatter *)dateFormatter1
{
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [self dateFormatterWithFormat:@"昨天 HH:mm"];
        dateFormatter.timeZone = [NSTimeZone localTimeZone];
    });
    return dateFormatter;
}

+ (NSDateFormatter *)dateFormatter2
{
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [self dateFormatterWithFormat:@"MM-dd HH:mm"];
        dateFormatter.timeZone = [NSTimeZone localTimeZone];
    });
    return dateFormatter;
}

+ (NSDateFormatter *)dateFormatter7
{
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [self dateFormatterWithFormat:@"yyyy.MM.dd"];
        dateFormatter.timeZone = [NSTimeZone localTimeZone];
    });
    return dateFormatter;
}

+ (NSDateFormatter *)dateFormatter4
{
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [self dateFormatterWithFormat:@"yyyy-MM-dd"];
        dateFormatter.timeZone = [NSTimeZone localTimeZone];
    });
    return dateFormatter;
}

+ (NSDateFormatter *)dateFormatter3
{
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [self dateFormatterWithFormat:@"yyyy-MM-dd HH:mm"];
        dateFormatter.timeZone = [NSTimeZone localTimeZone];
    });
    return dateFormatter;
}

+ (NSDateFormatter *)dateFormatter5
{
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [self dateFormatterWithFormat:@"HH"];
        dateFormatter.timeZone = [NSTimeZone localTimeZone];
    });
    return dateFormatter;
}

+ (NSDateFormatter *)dateFormatter6
{
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [self dateFormatterWithFormat:@"HH:mm"];
        dateFormatter.timeZone = [NSTimeZone localTimeZone];
    });
    return dateFormatter;
}


+ (NSString *)formattedPublishTimeToNow:(NSDate *)fromDate
{
    if (!fromDate) {
        return @"";
    }
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit1 = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    int unit2 = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *delta = [calendar components:unit1 fromDate:fromDate toDate:now options:0];
    NSDateComponents *fromCmps = [calendar components:unit2 fromDate:fromDate];
    NSDateComponents *toCmps = [calendar components:unit2 fromDate:now];
    
    if (fromCmps.year == toCmps.year) {
        // 今年
        if (fromCmps.month == toCmps.month && fromCmps.day == toCmps.day) {
            // 今天
            if (delta.hour >= 1) {
                // 至少是一个小时之前发布的
                return [NSString stringWithFormat:@"%ld小时前", (long)delta.hour];
            } else if (delta.minute >= 1) {
                // 1~59分钟之前发布的
                return [NSString stringWithFormat:@"%ld分钟前", (long)delta.minute];
            } else {
                // 1分钟内发布的
                return @"刚刚";
            }
        } else if (fromCmps.month == toCmps.month && fromCmps.day == toCmps.day - 1) {
            // 昨天
            NSDateFormatter *format = [self dateFormatter1];
            return [format stringFromDate:fromDate];
        } else {
            // 前天及以前
            NSDateFormatter *format = [self dateFormatter2];
            return [format stringFromDate:fromDate];
        }
    } else {
        // 往年
        NSDateFormatter *format = [self dateFormatter3];
        return [format stringFromDate:fromDate];
    }
}
//获取当前时间的年月日时分秒
+ (NSDateComponents*)getYearDay:(NSDate*)date
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *now;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    now=[NSDate date];
    comps = [calendar components:unitFlags fromDate:now];
    return comps;
}

//获取星期几
+ (NSDateComponents*)getWeekDay:(NSDate*)dateTime
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    comps = [calendar components:unitFlags fromDate:dateTime];
    return comps;
}

+ (void)setFormattedPublishTimeToNow:(NSDate *)fromDate withBlockAsync:(void(^)(NSString *, NSDictionary *))block
{
    [self setFormattedPublishTimeToNow:fromDate withBlockAsync:block userInfo:nil];
}

+ (void)setFormattedPublishTimeToNow:(NSDate *)fromDate withBlockAsync:(void(^)(NSString *, NSDictionary *))block userInfo:(NSDictionary *)userInfo
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *formattedTime = [self formattedPublishTimeToNow:fromDate];
        if (block) {
            dispatch_async(dispatch_get_main_queue(), ^{
                block(formattedTime, userInfo);
            });
        }
    });
}

+ (NSString *)formattedDeadlineTimeFromNow:(NSDate *)fromDate
{
    if (!fromDate) {
        return @"";
    }
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *fromCmps = [calendar components:unit fromDate:fromDate];
    NSDateComponents *toCmps = [calendar components:unit fromDate:now];
    
    if (fromCmps.year == toCmps.year) {
        // 今年
        NSDateFormatter *format = [self dateFormatter2];
        return [format stringFromDate:fromDate];
    } else {
        // 其他时间
        NSDateFormatter *format = [self dateFormatter3];
        return [format stringFromDate:fromDate];
    }
}

+ (void)setFormattedDeadlineTimeFromNow:(NSDate *)fromDate withBlockAsync:(void(^)(NSString *))block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *formattedTime = [self formattedDeadlineTimeFromNow:fromDate];
        if (block) {
            dispatch_async(dispatch_get_main_queue(), ^{
                block(formattedTime);
            });
        }
    });
}

+ (void)changeTheNavgationStyle:(UIViewController *)controller titleColor:(UIColor*)color barTintColor:(UIColor*)tinColor
{
    
    UIFont *font;
    font = [UIFont systemFontOfSize:18.0];//字体 HYXiZhongYuanJ 、huxiaobo-meixin
    
    NSDictionary* textAttributes = @{NSFontAttributeName:font,
                                     NSForegroundColorAttributeName:color};
    controller.navigationController.navigationBar.titleTextAttributes = textAttributes;
    controller.navigationController.navigationBar.barTintColor = tinColor;
    controller.navigationController.navigationBar.translucent = NO;//TODO:要注意全透明的情况
}

+(float)adjustWidths:(UIFont*)font content:(NSString*)content
{
    CGSize constraintSize = CGSizeMake(3000, 3000);
    CGRect textRect = [content boundingRectWithSize:constraintSize
                                                    options:NSStringDrawingUsesLineFragmentOrigin
                                                 attributes:@{NSFontAttributeName:font}
                                                    context:nil];
    return  textRect.size.width;
}

+(float)adjustHeight:(UIFont*)font content:(NSString*)content
{
    CGSize constraintSize = CGSizeMake(3000, 3000);
    CGRect textRect = [content boundingRectWithSize:constraintSize
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:@{NSFontAttributeName:font}
                                            context:nil];
    return  textRect.size.height;
}
//判断NSString字符串是否包含emoji表情

+ (BOOL)stringContainsEmoji:(NSString *)string

{
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar high = [substring characterAtIndex: 0];
                                
                                // Surrogate pair (U+1D000-1F9FF)
                                if (0xD800 <= high && high <= 0xDBFF) {
                                    const unichar low = [substring characterAtIndex: 1];
                                    const int codepoint = ((high - 0xD800) * 0x400) + (low - 0xDC00) + 0x10000;
                                    
                                    if (0x1D000 <= codepoint && codepoint <= 0x1F9FF){
                                        returnValue = YES;
                                    }
                                    
                                    // Not surrogate pair (U+2100-27BF)
                                } else {
                                    if (0x2100 <= high && high <= 0x27BF){
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
 }
//forbid emoil face
+ (NSString *)disable_emoji:(NSString *)text

{
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]" options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSString *modifiedString = [regex stringByReplacingMatchesInString:text
                                
                                                               options:0
                                
                                                                 range:NSMakeRange(0, [text length])
                                
                                                          withTemplate:@""];
    
    return modifiedString;
    
}


+ (NSString *)getIPAddress:(BOOL)preferIPv4
{
    NSArray *searchArray = preferIPv4 ?
    @[ IOS_VPN @"/" IP_ADDR_IPv4, IOS_VPN @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6 ] :
    @[ IOS_VPN @"/" IP_ADDR_IPv6, IOS_VPN @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4 ] ;
    
    NSDictionary *addresses = [self getIPAddresses];
    NSLog(@"addresses: %@", addresses);
    
    __block NSString *address;
    [searchArray enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop)
     {
         address = addresses[key];
         //筛选出IP地址格式
         if([self isValidatIP:address]) *stop = YES;
     } ];
    return address ? address : @"0.0.0.0";
}
+ (BOOL)isValidatIP:(NSString *)ipAddress {
    if (ipAddress.length == 0) {
        return NO;
    }
    NSString *urlRegEx = @"^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])$";
    
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:urlRegEx options:0 error:&error];
    
    if (regex != nil) {
        NSTextCheckingResult *firstMatch=[regex firstMatchInString:ipAddress options:0 range:NSMakeRange(0, [ipAddress length])];
        
        if (firstMatch) {
            NSRange resultRange = [firstMatch rangeAtIndex:0];
            NSString *result=[ipAddress substringWithRange:resultRange];
            //输出结果
            NSLog(@"%@",result);
            return YES;
        }
    }
    return NO;
}

+ (NSDictionary *)getIPAddresses
{
    NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
    
    // retrieve the current interfaces - returns 0 on success
    struct ifaddrs *interfaces;
    if(!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        struct ifaddrs *interface;
        for(interface=interfaces; interface; interface=interface->ifa_next) {
            if(!(interface->ifa_flags & IFF_UP) /* || (interface->ifa_flags & IFF_LOOPBACK) */ ) {
                continue; // deeply nested code harder to read
            }
            const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
            char addrBuf[ MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN) ];
            if(addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
                NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                NSString *type;
                if(addr->sin_family == AF_INET) {
                    if(inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv4;
                    }
                } else {
                    const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6*)interface->ifa_addr;
                    if(inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv6;
                    }
                }
                if(type) {
                    NSString *key = [NSString stringWithFormat:@"%@/%@", name, type];
                    addresses[key] = [NSString stringWithUTF8String:addrBuf];
                }
            }
        }
        // Free memory
        freeifaddrs(interfaces);
    }
    return [addresses count] ? addresses : nil;
}

//获取字符长度
+ (int)convertToByte:(NSString*)str {
    int strlength = 0;
    char* p = (char*)[str cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[str lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return (strlength+1)/2;
}


@end
