//
//  TableViewCell.h
//  TakeGoods
//
//  Created by 靳鹏飞 on 16/6/2.
//  Copyright © 2016年 靳鹏飞. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NearMsgs.h"

typedef void (^rush)(NSUInteger index);

@interface TableViewCell : UITableViewCell

@property (nonatomic,strong) NearMsgs *msg;

@property (weak, nonatomic) IBOutlet UILabel *require;
@property (weak, nonatomic) IBOutlet UILabel *time;

@property (weak, nonatomic) IBOutlet UIImageView *ava;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIButton *distance;
@property (weak, nonatomic) IBOutlet UIImageView *cerif;
@property (weak, nonatomic) IBOutlet UIButton *money;
@property (weak, nonatomic) IBOutlet UITextField *startPlace;
@property (weak, nonatomic) IBOutlet UITextField *destination;

@property (nonatomic,strong) UILabel *type1;
@property (nonatomic,strong) UILabel *type2;
@property (nonatomic,strong) UILabel *type3;

@property (weak, nonatomic) IBOutlet UITextField *titleFirst;
@property (weak, nonatomic) IBOutlet UITextField *titleSec;
@property (weak, nonatomic) IBOutlet UITextField *titleThree;

@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
@property (weak, nonatomic) IBOutlet UIImageView *img3;

@property (weak, nonatomic) IBOutlet UIView *typeBg;
@property (weak, nonatomic) IBOutlet UIView *typeBg2;



@property (nonatomic,copy) rush index;
@property (weak, nonatomic) IBOutlet UIButton *rushBtn;

- (void)rushList:(rush)block;

@end
