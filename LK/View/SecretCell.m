//
//  SecretCell.m
//  9Top
//
//  Created by KorzJ on 2016/11/7.
//  Copyright © 2016年 KorzJ. All rights reserved.
//

#import "SecretCell.h"

@implementation SecretCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.input setBk_shouldChangeCharactersInRangeWithReplacementStringBlock:^BOOL(UITextField *tf, NSRange rang, NSString *str) {
        NSString *secret = [tf.text stringByAppendingString:str];
        
        if (self.textChanged && [self checkSecretValid:secret]) self.textChanged(YES,secret);
        if (self.textChanged && ![self checkSecretValid:secret]) self.textChanged(NO,secret);
        return YES;
    }];
    
    [self.eye setImage:IMG(@"eyes_gray") forState:UIControlStateNormal];
    [self.eye setImage:IMG(@"eyes_red") forState:UIControlStateSelected];
}

    
- (IBAction)eyesClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    
   self.input.secureTextEntry= sender.selected ? NO : YES;
}

/**
 *  检验密码有效性 6-16位
 */
- (BOOL)checkSecretValid:(NSString *)secret{
    return secret.length>=6 && secret.length<=16;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
