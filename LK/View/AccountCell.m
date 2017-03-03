//
//  AccountCell.m
//  9Top
//
//  Created by KorzJ on 2016/11/7.
//  Copyright © 2016年 KorzJ. All rights reserved.
//

#import "AccountCell.h"

@implementation AccountCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.telInput.layer.borderWidth = 1.0f;
    self.telInput.layer.borderColor = [UIColor whiteColor].CGColor;

    UIImageView *leftTelephoneview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    leftTelephoneview.image = [IMG(@"telephone") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    leftTelephoneview.contentMode = UIViewContentModeScaleAspectFit;
    self.telInput.leftView = leftTelephoneview;
    self.telInput.leftViewMode = UITextFieldViewModeAlways;
    
    @weakify(self);
    [[self.telInput rac_signalForControlEvents:UIControlEventEditingDidBegin] subscribeNext:^(id x) {
        @strongify(self);
        self.telInput.backgroundColor = [UIColor whiteColor];
        self.telInput.layer.borderColor = [UIColor orangeColor].CGColor;
        self.telInput.layer.borderWidth = 1.0f;
    }];
    [[self.telInput rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(id x) {
        @strongify(self);
        self.telInput.backgroundColor = RGB(239, 239, 239, 1);
        self.telInput.layer.borderColor = [UIColor clearColor].CGColor;
    }];

    [self.telInput setBk_shouldChangeCharactersInRangeWithReplacementStringBlock:^BOOL(UITextField *tf, NSRange rang, NSString *str) {
        @strongify(self);
        NSString *mobile = [tf.text stringByAppendingString:str];
        
        if (mobile.length > 11) {
            return NO;
        }
        
        if (self.textChanged && [mobile validByMobile]) self.textChanged(YES,mobile);
        if (self.textChanged && ![mobile validByMobile]) self.textChanged(NO,mobile);
        
        //手机号码无效，验证码不能点击
        if ([mobile validByMobile]){
            self.codeBtn.enabled = YES;
        }else{
            self.codeBtn.enabled = NO;
        }
        return YES;
    }];
    [self.telInput becomeFirstResponder];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
