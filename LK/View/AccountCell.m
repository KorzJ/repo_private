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
    
    @weakify(self);
    [self.telInput setBk_shouldChangeCharactersInRangeWithReplacementStringBlock:^BOOL(UITextField *tf, NSRange rang, NSString *str) {
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
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
