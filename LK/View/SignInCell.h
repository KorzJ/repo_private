//
//  SignInCell.h
//  9Top
//
//  Created by KorzJ on 2016/11/7.
//  Copyright © 2016年 KorzJ. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 type

 @param type 1:登陆 2:注册 3:忘记密码
 */
typedef void (^signInClick)(NSUInteger type);

@interface SignInCell : UITableViewCell
@property (nonatomic,copy) signInClick signIn;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgetBtn;

- (void)signInClick:(signInClick)click;

@end
