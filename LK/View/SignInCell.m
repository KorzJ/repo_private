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

- (void)signInClick:(signInClick)click{
    self.signIn = [click copy];
}

- (IBAction)signIn:(UIButton *)sender {
    if (self.signIn) {
        self.signIn(1);
    }
}
- (IBAction)regist:(UIButton *)sender {
    if (self.signIn) {
        self.signIn(2);
    }
}
- (IBAction)forget:(id)sender {
    if (self.signIn) {
        self.signIn(3);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
