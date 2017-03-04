//
//  TGTableViewController.h
//  TakeGoods
//
//  Created by 靳鹏飞 on 16/6/8.
//  Copyright © 2016年 靳鹏飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LKTableTemplate : LKSuperVc

@property (nonatomic, assign)
BOOL  ignorePushFooter,ignorePullHeader,hasNext;

@property (nonatomic, assign)
NSInteger iPage;//页码

@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong)
NSMutableArray *items,*numCell;

@end
