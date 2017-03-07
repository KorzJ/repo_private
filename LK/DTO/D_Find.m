//
//  D_Find.m
//  LK
//
//  Created by KorzJ on 2017/3/4.
//  Copyright © 2017年 KorzJ. All rights reserved.
//

#import "D_Find.h"

#import "NearMsgs.h"

@implementation D_Find

- (void)handleServiceGetBanner{
    
    @weakify(self);
    LKNetoworkReqHandle *req = [LKNetoworkReqHandle new];
    req.requestPolicy = NSRequestNetworkService;
    [req fetchJSONByURL:@"banners"
            requestType:GET
             parameters:@{}
                success:^(id reponse) {
                    @strongify(self);
                    NSMutableArray *arrys = [NSMutableArray array];
                    NSArray *arr = (NSArray *)reponse;
                    for (NSDictionary *dic in arr) {
                        [arrys addObject:dic[@"picUrl"]];
                    }
                    self.banners = arrys;
                    NSLog(@"**********%@",self.banners);
                }
                failure:^(id reponse) {
                }];
}

- (void)handleServiceGetPOIListByLocation:(CLLocationCoordinate2D *)coor{
    NSDictionary *dic = @{
                                 @"code" :@"SUCCESS@",
                                 @"data" : @{
                                         @"count" : @"14",
                                         @"dataList" : @[@{
                                                     @"avatar" : @"http://121.199.5.148:5000/files/huodai/avatar/crop1474515559576_1474515560043.jpeg",
                                                     @"cargoId" : @"190",
                                                     @"cargoOwnerName" : @"张三",
                                                     @"certif" : @"Y",
                                                     @"createDate" : @"2016-09-20",
                                                     @"destination" : @"下城区石祥路",
                                                     @"distance" : @"4.70km",
                                                     @"id" : @"190",
                                                     @"latitude" : @"30.32339869607465",
                                                     @"longitude" : @"120.14780395896385",
                                                     @"noonType" : @"发生的发生",
                                                     @"startPlace" : @"下城区石祥路",
                                                     @"startTime" : @"2016-01-01",
                                                     @"transportType" : @"大货车",
                                                     @"volume" : @"10kg",
                                                     @"weight" : @"300kg"
                                                     }
                                                 ],
                                         @"next" : @"1"},
                                 };
    
   self.dataSource =  (NSMutableArray *)[NSArray yy_modelArrayWithClass:[NearMsgs class] json:dic[@"data"][@"dataList"]];
    
}

- (NSMutableArray *)banners{
    if (_banners) {
        return _banners;
    }
    _banners = [NSMutableArray array];
    return _banners;
}

- (NSMutableArray *)dataSource{
    if (_dataSource) {
        return _dataSource;
    }
    _dataSource = [NSMutableArray array];
    return _dataSource;
}

@end
