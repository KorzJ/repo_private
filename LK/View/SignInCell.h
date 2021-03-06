//
//  SignInCell.h
//  9Top
//
//  Created by KorzJ on 2016/11/7.
//  Copyright © 2016年 KorzJ. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^signInClick)();

@interface SignInCell : UITableViewCell
@property (nonatomic,copy) void (^signInClick)();

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgetBtn;


@end
