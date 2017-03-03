//
//  LoginUserInfo.h
//  YueYangLou
//
//  Created by KorzJ on 16/7/21.
//  Copyright © 2016年 KorzJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LoginUserInfo : NSObject

/**
 *   用户名
 */
@property (nonatomic, strong) NSString   * userName;
/**
 *  用户密码
 */
@property (nonatomic, strong) NSString   * passWord;
/**
 *  Uid
 */
@property (nonatomic,strong)  NSString   * uid;
/**
 *  手机号码
 */
@property (nonatomic, strong) NSString *telephone;
/**
 *  Token
 */
@property (nonatomic, strong) NSString   * memberAccessToken;
/**
 *  版本号
 */
@property (nonatomic, strong) NSString   * version;

/**
 *  登录状态
 */
@property (nonatomic, assign) BOOL   isLogin;

/**
 *  用户类型(货主/车主)
 */
@property (nonatomic, assign) BOOL cargoOwner;

/**
 *  用户类型(货主/车主)
 */
@property (nonatomic, assign) BOOL changeRole;

/**
 *  实名认证
 */
@property (nonatomic, strong) NSString* certificationStatus;

@property (nonatomic,strong) NSString *orderNum;
    

@property (nonatomic,strong) NSString *latitude;
@property (nonatomic,strong) NSString *longitude;

/**
 *  聊天记录 NICKNAME:昵称 AVARAGE :头像地址 USERID : 用户ID
 */
@property (nonatomic, strong) NSMutableArray *chatLists;

@property (nonatomic,assign) BOOL isEntryAPNS;
@property (nonatomic,assign) BOOL isChange;
/**
 *  单例
 *
 *  @return self
 */
+ (instancetype)sharedLoginUserInfo;
@end
