//
//  TipCell.m
//  LK
//
//  Created by KorzJ on 2017/3/8.
//  Copyright © 2017年 KorzJ. All rights reserved.
//

#import "TipCell.h"

@implementation TipCell

CGFloat gap = 10;//
CGFloat width = 60;//

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initLayout];
        [self addLayoutConstraints];
    }
    return self;
}

- (void)layoutSubviews{
    if (!self.iconIV.image) {
        self.titleLab.sd_layout
        .leftSpaceToView(self.contentView,gap)
        .topEqualToView(self.contentView)
        .heightIs(width)
        .widthIs(100);
    }
    
    [self updateConstraints];
}

- (void)initLayout{
    //init
    self.iconIV = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.iconIV.contentMode = UIViewContentModeScaleAspectFit;
    
    self.tipIV = [UIImageView new];
    self.tipIV.contentMode = UIViewContentModeScaleAspectFit;
    
    self.titleLab = [UILabel new];
    self.titleLab.textAlignment = NSTextAlignmentLeft;
    
    self.textLab = [UILabel new];
    self.textLab.textAlignment = NSTextAlignmentRight;

    [self.contentView sd_addSubviews:@[self.iconIV,self.titleLab,self.tipIV,self.textLab]];
}

- (void)addLayoutConstraints{
    
    self.iconIV.sd_layout
    .leftSpaceToView(self.contentView,gap)
    .topSpaceToView(self.contentView,0)
    .widthIs(width)
    .autoHeightRatio(1);
    
    self.titleLab.sd_layout
    .leftSpaceToView(self.iconIV,gap)
    .topEqualToView(self.iconIV)
    .heightRatioToView(self.iconIV,1)
    .widthIs(100);
    
    self.tipIV.sd_layout
    .rightSpaceToView(self.contentView,gap)
    .widthIs(width)
    .autoHeightRatio(1)
    .centerYEqualToView(self.iconIV);
    
    self.textLab.sd_layout
    .rightSpaceToView(self.tipIV,gap)
    .topEqualToView(self.iconIV)
    .heightRatioToView(self.iconIV,1)
    .leftSpaceToView(self.titleLab,gap);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
