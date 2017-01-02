//
//  Define.h
//  YueYangLou
//
//  Created by KorzJ on 16/6/24.
//  Copyright © 2016年 KorzJ. All rights reserved.
//

#ifndef Define_h
#define Define_h

/**
 *  FONT
 */
//#define Font(a) [UIFont fontWithName:@"PingFangSC-Regular" size:(a)]
#define Font(a)  [UIFont systemFontOfSize:(a)]

#define BoldFont(a) [UIFont boldSystemFontOfSize:(a)]
/**
 *  photo
 */
#define Image(a) [UIImage imageNamed:(a)]
/**
 *  RGB
 */
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define RGBFromHexadecimal(value) [UIColor colorWithRed:((float)((value & 0xFF0000) >> 16))/255.0 green:((float)((value & 0xFF00) >> 8))/255.0 blue:((float)(value & 0xFF))/255.0 alpha:1.0]
//字体 浅灰
#define COLORE_FONT_GRAY_LIGHT [UIColor colorWithRed:(153)/255.0 green:(153)/255.0 blue:(153)/255.0 alpha:(1)]
//字体 中灰
#define COLORE_FONT_GRAY_MIDDLE [UIColor colorWithRed:(102)/255.0 green:(102)/255.0 blue:(102)/255.0 alpha:(1)]
//字体 深灰
#define COLORE_FONT_GRAY_DARK [UIColor colorWithRed:(51)/255.0 green:(51)/255.0 blue:(51)/255.0 alpha:(1)]
//红色
#define COLORE_GLOBLE_RED [UIColor colorWithRed:(228)/255.0 green:(81)/255.0 blue:(74)/255.0 alpha:(1)]
//顶部分割线
#define COLORE_TOP_LINE [UIColor colorWithRed:(212)/255.0 green:(212)/255.0 blue:(212)/255.0 alpha:(1)]
#define COLORE_TOP_BG [UIColor colorWithRed:(255.0)/255.0 green:(255.0)/255.0 blue:(255.0)/255.0 alpha:(1)]
//内容分割线（灰色）
#define COLORE_CONTENT_LINE [UIColor colorWithRed:(235)/255.0 green:(235)/255.0 blue:(235)/255.0 alpha:(1)]
//内容背景色（灰色）
#define COLORE_BACKGROUNDCOLOR_LIGHTGRAY [UIColor colorWithRed:(235)/255.0 green:(235)/255.0 blue:(235)/255.0 alpha:(1)]

/**
 *  判断是否为IOS8以上的系统
 */
#define IOS8_OR_LATER (([UIDevice currentDevice].systemVersion.intValue) >= 8)
#define K_IPHONE6_PERCENT [UIScreen mainScreen].bounds.size.width/375
/**
 *  Screen Size
 */
#define K_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define K_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define K_SCREEN_BOUNDS [UIScreen mainScreen].bounds

//处理循环引用问题
#define K_WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

#endif /* Define_h */

#define notifyCenter ([NSNotificationCenter defaultCenter]) //通知
