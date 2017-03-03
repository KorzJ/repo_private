//  Created by KorzJ on 2017/1/1.

//==============================
//代码规范：美，简洁，高内聚，低耦合
//要        点：编码认真，切记心浮气躁
//==============================

#import "LKSuperExtendVc.h"

@implementation LKSuperExtendVc

#pragma mark -
#pragma mark LIFE CYCLE

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self logicJump];
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark -
#pragma mark INIT

- (void)J_initNavBar{}
- (void)J_initUI{}

#pragma mark -
#pragma mark EVENT 

#pragma mark -
#pragma mark PRIVATE METHD 

- (void)cmdExit{}

- (void)logicJump{
    if ([LoginUserInfo sharedLoginUserInfo].memberAccessToken.length == 0)
        [self presentViewController:[NSClassFromString(@"LoginVc") new] animated:YES completion:nil];
}
#pragma mark -
#pragma mark SERVICE


@end
