//
//  AppConfigContext.m
//  LK
//
//  Created by KorzJ on 2017/2/20.
//  Copyright © 2017年 KorzJ. All rights reserved.
//

#import "AppConfigContext.h"
#import <AFNetworkActivityIndicatorManager.h>
#import <IQKeyboardManager/IQKeyboardManager.h>

@implementation AppConfigContext

+ (id)sharedInstance
{
    static AppConfigContext *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AppConfigContext alloc] init];
    });
    return sharedInstance;
}

- (void)configAK{
    [self configIQKeyboardManager];
    [self configSVProgressHUD];
    [self configUMSocialManagerAK];
}

- (void)configIQKeyboardManager{
    [[IQKeyboardManager sharedManager] setEnable:NO];
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:YES];
    [[IQKeyboardManager sharedManager] setShouldShowTextFieldPlaceholder:YES];
    [[IQKeyboardManager sharedManager] setKeyboardDistanceFromTextField:10.0f];
}
- (void)configSVProgressHUD{
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    [SVProgressHUD setMinimumDismissTimeInterval:2.0];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
}
- (void)configUMSocialManagerAK{}

- (void)monitorNetwork{
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
                [[NSNotificationCenter defaultCenter] postNotificationName:K_NOTIFICATION_NETWORKSTATUS object:@NO];
                break;
            case AFNetworkReachabilityStatusUnknown:
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
            default:
                [[NSNotificationCenter defaultCenter] postNotificationName:K_NOTIFICATION_NETWORKSTATUS object:@YES];
                break;
        }
    }];
}

@end
