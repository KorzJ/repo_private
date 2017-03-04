//
//  D_Find.m
//  LK
//
//  Created by KorzJ on 2017/3/4.
//  Copyright © 2017年 KorzJ. All rights reserved.
//

#import "D_Find.h"

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
                    if (self.banners.count > 0)
                        [self.banners removeAllObjects];
                    NSArray *arr = (NSArray *)reponse;
                    for (NSDictionary *dic in arr) {
                        [self.banners addObject:dic[@"picUrl"]];
                    }
                    NSLog(@"**********%@",self.banners);
                }
                failure:^(id reponse) {
                }];
}

- (NSMutableArray *)banners{
    if (_banners) {
        return _banners;
    }
    _banners = [NSMutableArray array];
    return _banners;
}

@end
