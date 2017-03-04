//
//  TableViewCell.m
//  TakeGoods
//
//  Created by 靳鹏飞 on 16/6/2.
//  Copyright © 2016年 靳鹏飞. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.type1 = [[UILabel alloc] initWithFrame:CGRectZero];

    self.type2 = [[UILabel alloc] initWithFrame:CGRectZero];
    
    self.type3 = [[UILabel alloc] initWithFrame:CGRectZero];
    
    if ([LoginUserInfo sharedLoginUserInfo].cargoOwner) {
        [self.rushBtn setTitle:@"￥2500" forState:UIControlStateNormal];
        
        self.titleFirst.text = @"带货方式";
        self.titleSec.hidden = YES;
        self.titleThree.hidden = YES;
        
        self.img2.hidden = YES;
        self.img3.hidden = YES;
        
        [self.typeBg2 addSubview:self.type1];
        [self.typeBg2 addSubview:self.type2];
        [self.typeBg2 addSubview:self.type3];
        
        self.require.hidden = YES;
        self.time.hidden = YES;
        
//        self.titleSec.text = @"带货方式";
//        self.titleThree.text = @"装货时间";
        
//        self.img1.image = Image(@"License_plate_number");
//        self.img2.image = Image(@"Carry_cargo_way");
            self.img1.image = IMG(@"Carry_cargo_way");
        
    }else{
        
        self.titleSec.hidden = YES;
        self.titleThree.hidden = NO;
        
        self.img2.hidden = NO;
        self.img3.hidden = NO;
        
        [self.typeBg2 addSubview:self.type1];
        [self.typeBg2 addSubview:self.type2];
        [self.typeBg2 addSubview:self.type3];

        [self.rushBtn setImage:IMG(@"rush") forState:UIControlStateNormal];
    }
    
    self.titleSec.hidden = YES;
    self.titleThree.hidden = YES;
    
    self.img2.hidden = YES;
    self.img3.hidden = YES;
    
    self.require.hidden = YES;
    self.time.hidden = YES;
    // Initialization code
}

- (void)layoutSubviews{
    CGFloat gap  = 5.0f;
    
    self.name.text = self.msg.name;
//    [self.ava sd_setImageWithURL:[NSURL URLWithString:[self.msg.avatar stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] placeholderImage:IMG(@"default_ava")];
    if (self.msg.distance){
        [self.distance setTitle:[@" " stringByAppendingString:self.msg.distance] forState:UIControlStateNormal];
    }else{
        self.distance.hidden = YES;
    }
    self.date.text = self.msg.createDate;
    self.startPlace.text = self.msg.startPlace;
    self.destination.text = self.msg.destination;
    self.require.text = self.msg.truckNum ? self.msg.truckNum : self.msg.transportType;
    self.time.text = [NSString stringWithFormat:@"%@ %@",self.msg.startTime,self.msg.noonType];
    
    NSString *rush = [LoginUserInfo sharedLoginUserInfo].cargoOwner ? self.msg.fee : @"";
    [self.rushBtn setTitle:rush forState:UIControlStateNormal];
    
//    self.type1.text = [LoginUserInfo sharedLoginUserInfo].cargoOwner ? self.msg.transportType : nil;
    self.type1.text = self.msg.transportType;
    
    self.type1.frame = CGRectMake(0, 0, self.typeBg.width, 25);
    [self.type1 layoutSubviews];

    self.type2.text = self.msg.bear ? self.msg.bear : self.msg.weight;
    self.type2.frame = CGRectMake(CGRectGetMaxX(self.type1.frame)+gap, 0, self.typeBg.width, 25);
    if (self.type1.width < 1) {
        self.type2.frame = CGRectMake(CGRectGetMaxX(self.type1.frame), 0, self.typeBg.width, 25);
    }

    [self.type2 layoutSubviews];

    self.type3.text = self.msg.volume ? self.msg.volume : @"";
    self.type3.frame = CGRectMake(CGRectGetMaxX(self.type2.frame)+gap, 0, self.typeBg.width, 25);
    [self.type3 layoutSubviews];
    
    if ([self.msg.certif isEqualToString:@"Y"]) {
        self.cerif.hidden = NO;
    }else{
        self.cerif.hidden  = YES;
    }

}
- (IBAction)beginRushList:(UIButton *)sender {
    if (self.index) {
        self.index(self.tag);
    }
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    frame.origin.x +=10;
    frame.size.width -= 10;
}

- (void)rushList:(rush)block{
    self.index = [block copy];
}

#pragma mark -
#pragma mark Private Method

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
