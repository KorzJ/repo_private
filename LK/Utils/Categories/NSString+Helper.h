//
//  NSString+Helper.h
//  LK
//
//  Created by KorzJ on 2017/1/3.
//  Copyright © 2017年 KorzJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Helper)

- (BOOL)validByNumber;
- (BOOL)validByMobile;
- (BOOL)validByEmail;
- (BOOL)validByPassword;
- (BOOL)validByIdentityCard;
+ (BOOL)validByURL;
@end
