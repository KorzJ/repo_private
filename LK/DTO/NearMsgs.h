//
//  NearMsgs.h
//  TakeGoods
//
//  Created by KorzJ on 16/8/24.
//  Copyright © 2016年 靳鹏飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NearMsgs : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *avatar;
@property (nonatomic) NSString *distance;
@property (nonatomic) NSString *createDate;
@property (nonatomic) NSString *startPlace;
@property (nonatomic) NSString *destination;
@property (nonatomic) NSString *startTime;
@property (nonatomic) NSString *certif;

//附近带货人
@property (nonatomic) NSString *truckNum;
@property (nonatomic) NSString *volume;
@property (nonatomic) NSString *bear;
@property (nonatomic) NSString *fee;
@property (nonatomic) NSString *routeId;
@property (nonatomic) NSString *noonType;
@property (nonatomic) NSString *transportType;

//附近货源
@property (nonatomic) NSString *cargoId;
@property (nonatomic) NSString *weight;

@property (nonatomic) NSString  *longitude,
                                                       *latitude;
- (void)insertModel:(NSDictionary *)item;

@end
