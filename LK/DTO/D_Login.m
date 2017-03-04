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
    
    RAC(self,vaild_tel) = [telSignal map:^id(id value) {
        if ([value isKindOfClass:[NSString class]] && [value validByMobile])
            return @YES;
            return @NO;
    }];
    RAC(self,vaild_secret) = [passworkSignal map:^id(NSString *value) {
        if ([value isKindOfClass:[NSString class]] || [value validByPassword])
            return @YES;
            return @NO;
    }];
    RAC(self,vaild_input) = [[RACObserve(self, vaild_tel) combineLatestWith:RACObserve(self, vaild_secret)] map:^id(id value) {
        NSArray *arry = [value allObjects];
        return [NSNumber numberWithBool:[arry[0] boolValue] && [arry[1] boolValue]];
    }];
}


#pragma mark -
#pragma mark SERVICE

- (void)handleServiceCodeByTel:(NSString *)telephone{
    @weakify(self);
    LKNetoworkReqHandle *req = [LKNetoworkReqHandle new];
    [req fetchJSONByURL:@"users/authCode"
            requestType:GET
             parameters:@{
                          @"mobile":telephone}
                success:^(id reponse) {
                    @strongify(self);
                    self.success_code = YES;
                }
                failure:^(id reponse) {
                }];
}
- (void)handleServiceLoginByTel:(NSString *)telephone Code:(NSString *)code{
    @weakify(self);
    LKNetoworkReqHandle *req = [LKNetoworkReqHandle new];
    [req fetchJSONByURL:@"users/tokens"
            requestType:GET
             parameters:@{
                          @"mobile":telephone,
                          @"authCode":code,
                          @"deviceType":@"I",
                          @"deviceCode":@"123412341234"}
                success:^(id reponse) {
                    @strongify(self);
                    [[LoginUserInfo sharedLoginUserInfo] setMemberAccessToken:reponse[@"token"]];
                    self.success_login = YES;
                }
                failure:^(id reponse) {
                }];
}

#pragma mark -
#pragma mark GET

- (NSDictionary *)dataSource{
    return _dataSource ? _dataSource : [NSDictionary dictionary];
}
@end
