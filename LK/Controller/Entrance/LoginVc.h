//
//  ViewController.h
//  LK
//
//  Created by KorzJ on 2017/1/1.
//  Copyright © 2017年 KorzJ. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "D_Login.h"

@interface LoginVc : LKTableTemplate{}
@property (nonatomic,assign) BOOL vaild;

@property (nonatomic,strong) D_Login *dto;
@end
