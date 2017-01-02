//  Created by KorzJ on 2017/1/2.

//==============================
//代码规范：美，简洁，高内聚，低耦合
//要        点：编码认真，切记心浮气躁
//==============================

#import "LKNetworkOffVc.h"

@implementation LKNetworkOffVc

#pragma mark -
#pragma mark LIFE CYCLE

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self J_initNavBar];
    [self J_initUI];
}

#pragma mark -
#pragma mark INIT

- (void)J_initNavBar{
    [self.sNavTitle setText:@"网络无连接"];
}
- (void)J_initUI{}

#pragma mark -
#pragma mark EVENT 

#pragma mark -
#pragma mark PRIVATE METHD 

#pragma mark -
#pragma mark SERVICE

#pragma mark -
#pragma mark GET

@end
