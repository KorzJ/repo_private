//
//  DTO_Login.m
//  LK
//
//  Created by KorzJ on 2017/1/3.
//  Copyright © 2017年 KorzJ. All rights reserved.
//

#import "D_Login.h"

@implementation D_Login

#pragma mark -
#pragma mark INIT

- (instancetype)init{
    self = [super init];
    if (self) {
        [self rac_addObserver];
    }
    return self;
}

- (void)rac_addObserver{
    
    RACSignal *telSignal = RACObserve(self, telephone);
    RACSignal *passworkSignal = RACObserve(self, passoword);
    
    RAC(self,vaildTel) = [telSignal map:^id(id value) {
        if ([value isKindOfClass:[NSString class]] && [value validByMobile])
            return @YES;
            return @NO;
    }];
    RAC(self,vaildSecret) = [passworkSignal map:^id(NSString *value) {
        if ([value isKindOfClass:[NSString class]] &&[value validByPassword])
            return @YES;
            return @NO;
    }];
    RAC(self,vaildInput) = [[RACObserve(self, vaildTel) combineLatestWith:RACObserve(self, vaildSecret)] map:^id(id value) {
        NSArray *arry = [value allObjects];
        return [NSNumber numberWithBool:[arry[0] boolValue] && [arry[1] boolValue]];
    }];
}


#pragma mark -
#pragma mark SERVICE

- (void)loginWithTelephone:(NSString *)tel password:(NSString *)password{
    @weakify(self);
    LKNetoworkReqHandle *req = [LKNetoworkReqHandle new];
    [req fetchJSONByURL:@"http://114.55.74.245:2000/jiuhao-buy/buyers/authCode"
                    requestType:GET
                    parameters:@{
                              @"mobile":@"13022127999",
                              @"type":@"1"}
                    success:^(id reponse) {
                        self.success = YES;
                        self.dataSource = reponse;
                    }
                    failure:^(id reponse) {
                        self.success = YES;
                    }];
}

#pragma mark -
#pragma mark GET

- (NSDictionary *)dataSource{
    if (_dataSource)
        return _dataSource;
    return [NSDictionary dictionary];
}
@end
