//
//  D_Find.h
//  LK
//
//  Created by KorzJ on 2017/3/4.
//  Copyright © 2017年 KorzJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface D_Find : NSObject

@property (nonatomic,strong)
NSMutableArray *banners,*dataSource;

- (void)handleServiceGetBanner;
- (void)handleServiceGetPOIListByLocation:(CLLocationCoordinate2D *)coor;

@end
