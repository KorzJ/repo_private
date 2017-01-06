//
//  DTO_Login.h
//  LK
//
//  Created by KorzJ on 2017/1/3.
//  Copyright © 2017年 KorzJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface D_Login : NSObject

@property (nonatomic,strong) NSString   *telephone,
                                                                    *passoword;

@property (nonatomic,assign,readwrite) BOOL   vaildTel,
                                                                              vaildSecret,
                                                                              vaildInput,
                                                                              success;

@property (nonatomic,strong) NSDictionary *dataSource;

- (void)loginWithTelephone:(NSString *)tel
                              password:(NSString *)password;
@end
