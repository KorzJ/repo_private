//  Created by KorzJ on 2017/1/16.

//==============================
//代码规范：美，简洁，高内聚，低耦合
//要        点：编码认真，切记心浮气躁
//==============================

#import "MenuVc.h"

@implementation MenuVc

#pragma mark -
#pragma mark LIFE CYCLE

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self J_initUI];
}

#pragma mark -
#pragma mark INIT

- (void)J_initNavBar{}
- (void)J_initUI{
    self.view.backgroundColor = [UIColor redColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [btn setTitle:@"测试" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark -
#pragma mark EVENT 

- (void)click{
    [self presentViewController:[NSClassFromString(@"LoginVc") new] animated:YES completion:nil];
}

#pragma mark -
#pragma mark PRIVATE METHD 

#pragma mark -
#pragma mark SERVICE

#pragma mark -
#pragma mark GET

@end
