//
//  AppDelegate.m
//  LK
//
//  Created by KorzJ on 2017/1/1.
//  Copyright © 2017年 KorzJ. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self J_initUI];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {}
- (void)applicationDidEnterBackground:(UIApplication *)application {}
- (void)applicationWillEnterForeground:(UIApplication *)application {}
- (void)applicationDidBecomeActive:(UIApplication *)application {}
- (void)applicationWillTerminate:(UIApplication *)application {}


#pragma mark -
#pragma mark INIT

- (void)J_initUI
{
    HomeVc *homeVc = [HomeVc sharedManger];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[LKNavVc alloc] initWithRootViewController:homeVc];
    [self.window makeKeyAndVisible];
}

@end
