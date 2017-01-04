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
    
    K_WS(weakSelf);
    [self.telInput setBk_shouldChangeCharactersInRangeWithReplacementStringBlock:^BOOL(UITextField *tf, NSRange rang, NSString *str) {
        NSString *mobile = [tf.text stringByAppendingString:str];
        
        if (mobile.length > 11) {
            return NO;
        }
        
        if (weakSelf.textChanged && [mobile validByMobile]) weakSelf.textChanged(YES,mobile);
        if (weakSelf.textChanged && ![mobile validByMobile]) weakSelf.textChanged(NO,mobile);
        
        //手机号码无效，验证码不能点击
        if ([mobile validByMobile]){
            weakSelf.codeBtn.enabled = YES;
        }else{
            weakSelf.codeBtn.enabled = NO;
        }
        return YES;
    }];
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
