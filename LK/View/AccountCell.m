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
    
    [self.codeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.codeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    
    K_WS(weakSelf);
    [self.telInput setBk_shouldChangeCharactersInRangeWithReplacementStringBlock:^BOOL(UITextField *tf, NSRange rang, NSString *str) {
        NSString *mobile = [tf.text stringByAppendingString:str];
        
        if (mobile.length > 11) {
            return NO;
        }
        
        if (weakSelf.valid && [weakSelf checkTelephoneValid:mobile]) weakSelf.valid(YES,mobile);
        if (weakSelf.valid && ![weakSelf checkTelephoneValid:mobile]) weakSelf.valid(NO,mobile);
        
        //手机号码无效，验证码不能点击
        if ([weakSelf checkTelephoneValid:mobile]){
            weakSelf.codeBtn.enabled = YES;
        }else{
            weakSelf.codeBtn.enabled = NO;
        }
        return YES;
    }];
    
    // Initialization code
}

- (void)check:(valid)valid{
    self.valid  =[valid copy];
}

- (void)codeBtnClick:(codeBtnClick)block{
    self.block_code = block;
}

- (IBAction)codeClick:(UIButton *)sender {
    
    if (self.block_code) self.block_code();
}

/**
 *  检验手机号码有效性
 */
- (BOOL)checkTelephoneValid:(NSString *)mobile{
    NSString *mobileRegex = @"^((13[0-9])|(147)|(170)|(15[^4,\\D])|(18[^4]))\\d{8}$";
    NSPredicate *mobileTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",mobileRegex];
    return [mobileTest evaluateWithObject:mobile];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
