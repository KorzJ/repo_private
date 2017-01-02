//
//  const.h
//  YueYangLou
//
//  Created by KorzJ on 16/6/25.
//  Copyright © 2016年 KorzJ. All rights reserved.
//

#ifndef const_h
#define const_h

#import <Foundation/Foundation.h>

//-------------------------------------占位符----------------------------------------//
#define K_PLACEHOLDER_NULL @"/" //空数据占位符

//-------------------------------------通知----------------------------------------//
#define notifyCenter ([NSNotificationCenter defaultCenter])

//登陆状态改变
#define K_NOTIFICATION_LOGINSTATUSCHANGED @"login_state_changed"
//网络状态改变
#define K_NOTIFICATION_NETWORKSTATUS @"netword_state_changed"
//登陆失效
#define K_NOTIFICATION_LOGININVAILD @"login_state_invaild"

//登陆
#define K_NOTIFICATION_POPPERSON @"pop_PersonCenter"

//首页做数据强制刷新
#define K_NOTIFICATION_HOME_REFRESH @"home_refresh"
//-------------------------------------关联对象----------------------------------//

#define KAssociatedObject @"KAssociatedObject"

//-------------------------------------WCAlertView-----------------------------//

//Cancel
#define K_ProgressHUD_CANCEL @"取消"
#define K_ProgressHUD_TITLE @"小贴士"
#define K_ProgressHUD_NOMORE @"没有更多了"

#define K_IBActionSheet_Picture @"选择图片"
#define K_IBActionSheet_Camera @"拍照"
#define K_IBActionSheet_Album @"我的相册"
#define K_IBActionSheet_Cancel @"取消"

#define K_NOTIFICATION_LOGININVAILD @"login_state_invaild"
#define K_NOTIFICATION_BACKTOROOTVC @"pop_to_root" //强制回到菜单页

//-------------------------------------支付回调-----------------------------//
#define K_NOTIF_URL_ALIPAY @"www.baidu.com"
#define K_NOTIF_URL_WECHAT @"www.baidu.com"

//-------------------------------------枚举---------------------------------------//

typedef NS_ENUM(NSInteger, NSDeviceType)
{
    I,      //iOS
    A      //Android
};

/**
 *  AppKey
 */

/**
 *  导航栏高度
 */
#define K_NAV_HEIGHT 64

#endif /* const_h */
