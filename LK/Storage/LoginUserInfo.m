//
//  LoginUserInfo.m
//  YueYangLou
//
//  Created by KorzJ on 16/7/21.
//  Copyright © 2016年 KorzJ. All rights reserved.
//

#import "LoginUserInfo.h"

@implementation LoginUserInfo

static  NSString *Key_UserName = @"Key_UserName";
static  NSString *Key_Password = @"Key_Password";
static  NSString *Key_Uid = @"Key_Uid";
static  NSString *Key_Token = @"Key_Token";
static  NSString *Key_ApplicationVersion = @"Key_ApplicationVersion";
static  NSString *Key_isLogin = @"Key_isLogin";
static  NSString *Key_UserType = @"Key_UserType";
static  NSString *Key_ChangeRole = @"Key_ChangeRole";
static  NSString *Key_isChangeing = @"Key_isChangeing";

static  NSString *Key_HasCertification = @"Key_HasCertification";

static  NSString *Key_Telephone = @"Key_Telephone";
static  NSString *Key_LocationCoor = @"Key_LocationCoor";
static  NSString *Key_ChatLists = @"Key_ChatLists";
static  NSString *Key_OrderNumber = @"Key_OrderNumber";

static  NSString *Key_Latitude = @"Key_Latitude";
static  NSString *Key_Longitude = @"Key_Longitude";

+ (instancetype)sharedLoginUserInfo
{
    static dispatch_once_t once;
    static LoginUserInfo * loginUser;
    dispatch_once(&once, ^{
        if (!loginUser) {
            loginUser = [[LoginUserInfo alloc] init];
        }
    });
    return loginUser;
} 

- (void)setUserName:(NSString *)userName{
    [[NSUserDefaults standardUserDefaults] setObject:userName forKey:Key_UserName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (NSString *)userName{
   return [[NSUserDefaults standardUserDefaults] objectForKey:Key_UserName];
}

- (void)setPassWord:(NSString *)passWord{
    [[NSUserDefaults standardUserDefaults] setObject:passWord forKey:Key_Password];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)passWord{
    return [[NSUserDefaults standardUserDefaults] objectForKey:Key_Password];
}

- (void)setMemberAccessToken:(NSString *)memberAccessToken{
    [[NSUserDefaults standardUserDefaults] setObject:memberAccessToken forKey:Key_Token];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)memberAccessToken{
    return [[NSUserDefaults standardUserDefaults] objectForKey:Key_Token];
}

- (void)setUid:(NSString *)uid{
    [[NSUserDefaults standardUserDefaults] setObject:uid forKey:Key_Uid];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)uid{
    return [[NSUserDefaults standardUserDefaults] objectForKey:Key_Uid];
}
- (void)setTelephone:(NSString *)telephone{
    [[NSUserDefaults standardUserDefaults] setObject:telephone forKey:Key_Telephone];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)telephone{
    return [[NSUserDefaults standardUserDefaults] objectForKey:Key_Telephone];
}


- (void)setVersion:(NSString *)version{
    [[NSUserDefaults standardUserDefaults] setObject:version forKey:Key_ApplicationVersion];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)version{
    return [[NSUserDefaults standardUserDefaults] objectForKey:Key_ApplicationVersion];
}

- (void)setOrderNum:(NSString *)orderNum
{
    [[NSUserDefaults standardUserDefaults] setObject:orderNum forKey:Key_OrderNumber];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
    
- (NSString *)orderNum{
    return [[NSUserDefaults standardUserDefaults] objectForKey:Key_OrderNumber];
}

- (void)setLatitude:(NSString *)latitude{
    [[NSUserDefaults standardUserDefaults] setObject:latitude forKey:Key_Latitude];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)latitude{
    return [[NSUserDefaults standardUserDefaults] objectForKey:Key_Latitude];
}

- (void)setLongitude:(NSString *)longitude{
    [[NSUserDefaults standardUserDefaults] setObject:longitude forKey:Key_Longitude];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)longitude{
    return [[NSUserDefaults standardUserDefaults] objectForKey:Key_Longitude];
}
- (void)setIsLogin:(BOOL)isLogin{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:isLogin] forKey:Key_isLogin];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)isLogin{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:Key_isLogin] boolValue];
}

- (void)setCargoOwner:(BOOL)cargoOwner{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:cargoOwner] forKey:Key_UserType];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)cargoOwner{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:Key_UserType] boolValue];
}

- (void)setChangeRole:(BOOL)changeRole{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:changeRole] forKey:Key_ChangeRole];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)changeRole{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:Key_ChangeRole] boolValue];
}

- (void)setIsChange:(BOOL)isChange{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:isChange] forKey:Key_isChangeing];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)isChange{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:Key_isChangeing] boolValue];
}


- (void)setCertificationStatus:(NSString *)certificationStatus{
    [[NSUserDefaults standardUserDefaults] setObject:certificationStatus forKey:Key_HasCertification];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)certificationStatus{
    return [[NSUserDefaults standardUserDefaults] objectForKey:Key_HasCertification];
}

- (void)setChatLists:(NSMutableArray *)chatLists{
    [[NSUserDefaults standardUserDefaults] setObject:chatLists forKey:Key_ChatLists];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (NSMutableArray *)chatLists{
    return [[NSUserDefaults standardUserDefaults] objectForKey:Key_ChatLists];
}
@end
