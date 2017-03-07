//
//  DTO_Login.h
//  LK
//
//  Created by KorzJ on 2017/1/3.
//  Copyright © 2017年 KorzJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface D_Login : NSObject

@property (nonatomic,strong)
NSString *telephone,*passoword;

@property (nonatomic,assign,readwrite)
BOOL vaild_tel,vaild_secret,vaild_input,success_code,success_login;

- (void)handleServiceCodeByTel:(NSString *)telephone;
- (void)handleServiceLoginByTel:(NSString *)telephone Code:(NSString *)code;

@end
