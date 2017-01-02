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

#define K_SVP_Cancel @"取消"
#define K_Action_Yes @"确定"

#define K_NOTIFICATION_LOGININVAILD @"login_state_invaild"
#define K_NOTIFICATION_BACKTOROOTVC @"pop_to_root" //强制回到菜单页

//-------------------------------------支付回调-----------------------------//
#define K_NOTIF_URL_ALIPAY @"www.baidu.com"
#define K_NOTIF_URL_WECHAT @"www.baidu.com"

//======= clear Cache ========
#define success_clearCache @"清除成功"

//=========通用提示=========
#define success_submit @"提交成功"
#define error_submit @"提交失败"
#define error_inPutInfomation @"请把信息填写完整！"

//======SERVICE==================
#define service_error @"请求失败"
#define service_updateNickName @"昵称不能超过10个中文字符喔"
//========feedBack==========
#define success_feedBack @"感谢您的反馈!"
#define error_feedBack @"提交失败,请稍后重试!"
//修改各种密码
#define success_MlogingPass @"修改成功,请重新登录"
#define error_MlogingPass @"修改失败,请稍后重试"
#define success_bindTel @"绑定成功" //绑定手机号码
#define error_bindTel @"绑定失败,请重新绑定" //绑定手机号码
#define error_info @"信息填写不正确"
#define error_tel @"手机号码输入有误"
#define error_vercode @"验证码错误"
#define error_checkUser @"验证身份失败,请重新验证"
#define success_ModifyTel @"手机号码更改成功"
#define error_NotEqual  @"密码不一致,请重新输入"
#define success_setPayPass @"设置支付密码成功"
//个人中心跳到微信提示

#define K_AlertWeixin_Title @"微信关注服务号\"九好店商\"我们竭诚为您服务"
#define K_AlertCarema_Title @"最多只能上传五张照片哦"

//访问相机
#define K_Alert_Photo @"请在设备的设置-隐私-照片中允许访问相机"
//意见反馈
#define kDefaultContentPrompt @"九好店商期待与您交流"
//福利卡卡号错误提示
#define error_cardNum @"您输入的卡号有误请重新输入"
//修改昵称成都
#define error_nickName @"最多可输入10个字符长度喔"
//福利卡充值成功提示
#define success_freeCardRechang @"充值成功"
//福利卡充值失败
#define error_freeCardRechang @"充值失败"

//退换货
#define error_refundAccount @"超过最大退款金额，请重新填写"
#define error_photoMax @"最多只能选取3张照片"
#define success_cancelrefund @"撤销成功"
#define error_cancelrefund @"撤销失败，请稍后再试"

//第一次打开app标识
// Constant identify
#define kFirstTimeOpenApp @"kFirstTimeOpenApp"
//第一次绑定手机
#define kFirstTimeBindTel @"kFirstTimeBindTel"
//第一次设置支付密码
#define kFirstTimeSetPayPass @"kFirstTimeSetPayPass"


#define K_Order_No @"否"
#define K_Order_Yes @"是"


#define K_CancelOrder_Title @"要取消此订单"
#define K_ConfirmDeliver_Title @"要确认收货"
#define K_CancelRefundApply_Title @"要取消申请退款"
#define K_DeleteOrder_Title @"要删除此订单"

//#define K_Order_No @"否"
//#define K_Order_Yes @"是"
//


//=======================通知============
#define successSubmitRefunding @"successSubmitRefunding"

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
