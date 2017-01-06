//
//  SignInCell.m
//  9Top
//
//  Created by KorzJ on 2016/11/7.
//  Copyright © 2016年 KorzJ. All rights reserved.
//

#import "SignInCell.h"

@implementation SignInCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor clearColor];
    self.loginBtn.enabled = NO;
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginBtn setTitle:@"不能登录" forState:UIControlStateDisabled];
    // Initialization code
}

- (IBAction)signIn:(UIButton *)sender {
    if (self.signInClick) {
        self.signInClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
