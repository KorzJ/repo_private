//
//  AppConfigContext.h
//  LK
//
//  Created by KorzJ on 2017/2/20.
//  Copyright © 2017年 KorzJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppConfigContext : NSObject

+ (id)sharedInstance;

- (void)configAK;
@end
