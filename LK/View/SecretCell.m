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
    
    [self initModuleStyle];
    [self initRAC];
}

- (IBAction)eyesClick:(UIButton *)sender {
    if (self.getCodeEvent)
        self.getCodeEvent();
}

/**
 *  检验密码有效性 6-16位
 */
- (BOOL)checkSecretValid:(NSString *)secret{
    return secret.length>=6 && secret.length<=16;
}

//module style
- (void)initModuleStyle{
    self.input.layer.borderWidth = 1.0f;
    self.input.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [self.eye setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.eye setTitleColor:RGB(219, 219, 219, 1) forState:UIControlStateDisabled];
    
    UIImageView *leftTelephoneview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    leftTelephoneview.image = [IMG(@"") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    leftTelephoneview.contentMode = UIViewContentModeScaleAspectFit;
    self.input.leftView = leftTelephoneview;
    self.input.leftViewMode = UITextFieldViewModeAlways;
}

- (void)initRAC{
    @weakify(self);
    [[self.input rac_signalForControlEvents:UIControlEventEditingDidBegin] subscribeNext:^(id x) {
        @strongify(self);
        self.input.backgroundColor = [UIColor whiteColor];
        self.input.layer.borderColor = [UIColor orangeColor].CGColor;
    }];
    [[self.input rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(id x) {
        @strongify(self);
        self.input.backgroundColor = RGB(239, 239, 239, 1);
        self.input.layer.borderColor = [UIColor clearColor].CGColor;
    }];
    
    [self.input setBk_shouldChangeCharactersInRangeWithReplacementStringBlock:^BOOL(UITextField *tf, NSRange rang, NSString *str) {
        NSString *secret = [tf.text stringByAppendingString:str];
        
        if (self.textChanged && [self checkSecretValid:secret]) self.textChanged(YES,secret);
        if (self.textChanged && ![self checkSecretValid:secret]) self.textChanged(NO,secret);
        return YES;
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
