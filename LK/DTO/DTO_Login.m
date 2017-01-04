//
//  DTO_Login.m
//  LK
//
//  Created by KorzJ on 2017/1/3.
//  Copyright © 2017年 KorzJ. All rights reserved.
//

#import "DTO_Login.h"

@implementation DTO_Login

- (instancetype)init{
    self = [super init];
    if (self) {
        [self addObserver];
    }
    return self;
}

- (void)addObserver{
    RACSignal *telSignal = RACObserve(self, telephone);
    RACSignal *passworkSignal = RACObserve(self, passoword);
    
    RAC(self,vaildTel) = [telSignal map:^id(id value) {
        if ([value isKindOfClass:[NSString class]] && [value validByMobile])return @NO;
        return @YES;
    }];
    
    RAC(self,vaildSecret) = [passworkSignal map:^id(NSString *value) {
        if ([value isKindOfClass:[NSString class]] &&[value validByPassword])return @YES;
        return @NO;
    }];
    
    RAC(self,vaildInput) = [[RACObserve(self, vaildTel) combineLatestWith:RACObserve(self, vaildSecret)] map:^id(id value) {
        NSArray *arry = [value allObjects];
        return [NSNumber numberWithBool:arry[0] && arry[1]];
    }];

}

- (void)loginWithTelephone:(NSString *)tel password:(NSString *)password{
    @weakify(self);
    LKNetoworkReqHandle *req = [LKNetoworkReqHandle new];
    [req getDictionaryByURL:@"http://114.55.74.245:2000/buyers/tokens"
                requestType:GET
                 parameters:@{
                              @"mobile":@"13022157299",
                              @"password":@"sn5diphone6",
                              @"deviceCode":@"1234",
                              @"deviceType":@"IOS"}
                    success:^(id reponse) {
                        self_weak_.success = YES;
                    }
                    failure:^(id reponse) {
                        self_weak_.success = NO;
                    }];
}

#pragma mark -
#pragma mark GET

@end
