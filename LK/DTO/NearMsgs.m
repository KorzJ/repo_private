//
//  NearMsgs.m
//  TakeGoods
//
//  Created by KorzJ on 16/8/24.
//  Copyright © 2016年 靳鹏飞. All rights reserved.
//

#import "NearMsgs.h"

@implementation NearMsgs
- (void)insertModel:(NSDictionary *)item{
    
    self.name = item[@"cargoOwnerName"] ? item[@"cargoOwnerName"] : item[@"truckOwnerName"];
    self.avatar = item[@"avatar"];
    self.distance = item[@"distance"];
    self.createDate = item[@"createDate"];
    self.startPlace	 = item[@"startPlace"];
    self.destination = item[@"destination"];
    self.startTime = item[@"startTime"];
    self.certif = item[@"certif"];
    
    self.cargoId = item[@"cargoId"];
    self.truckNum = item[@"truckNum"];
    self.volume = item[@"volume"];
    self.bear = item[@"bear"];
    self.fee = item[@"fee"];
    self.noonType = item[@"noonType"];
    self.transportType = item[@"transportType"];
    
    self.routeId = item[@"routeId"];
    self.weight = item[@"weight"];
    self.routeId = item[@"routeId"];
    
    self.longitude = item[@"longitude"];
    self.latitude = item[@"latitude"];

}

@end
