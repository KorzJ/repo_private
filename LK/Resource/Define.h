//
//  Define.h
//  YueYangLou
//
//  Created by KorzJ on 16/6/24.
//  Copyright © 2016年 KorzJ. All rights reserved.
//

#ifndef Define_h
#define Define_h

#define NOTIFY ([NSNotificationCenter defaultCenter]) //通知
#define FONT(a)  [UIFont systemFontOfSize:(a)]
#define IMG(a) [UIImage imageNamed:(a)]
#define RGB(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define RGBFromHexadecimal(value) [UIColor colorWithRed:((float)((value & 0xFF0000) >> 16))/255.0 green:((float)((value & 0xFF00) >> 8))/255.0 blue:((float)(value & 0xFF))/255.0 alpha:1.0]

#define COLORE_SYSTEM [UIColor colorWithRed:250/255.0 green:116/255.0 blue:10/255.0 alpha:(1)]

//SCREEN
#define K_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define K_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define K_SCREEN_BOUNDS [UIScreen mainScreen].bounds

//读取app配置
#define APP_PLIST_CONFIG ([LKObjectUtil dictionaryFromConfig:@"application.plist"])

//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

#endif /* Define_h */
