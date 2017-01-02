//
//  ViewController.h
//  LK
//
//  Created by KorzJ on 2017/1/1.
//  Copyright © 2017年 KorzJ. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SignInCell.h"
#import "AccountCell.h"
#import "SecretCell.h"
@interface LoginVc : LKTableTemplate{
    UIButton *_loginBtn;
    UIButton *_codeBtn;
    UITextField *_codeTF;
    UIButton  *_eyes;
    
    NSString *_mobile;
    NSString *_code;
    NSString *_secret;
    
    BOOL _vaildMobile;
    BOOL _vaildSecret;
    BOOL _vaildCode;
    
    BOOL _isAgreePro;
}
@property (nonatomic,assign) BOOL vaild;
@end
