//  Created by KorzJ on 2017/1/1.

//==============================
//代码规范：美，简洁，高内聚，低耦合
//要        点：编码认真，切记心浮气躁
//==============================

#import "LKSuperVc.h"

@implementation LKSuperVc

#pragma mark -
#pragma mark LIFE CYCLE

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (!self.navigationController.navigationBar.hidden)self.navigationController.navigationBar.hidden = YES;
    if (!self.navigationController.navigationBarHidden)self.navigationController.navigationBarHidden = YES;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self J_initSupNavBar];
    [self J_initSupUI];
}

#pragma mark -
#pragma mark INIT

- (void)J_initSupNavBar{
}
- (void)J_initSupUI{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.sNavView];
    [self.sNavView addSubview:self.sNavLeft];
    [self.sNavView addSubview:self.sNavTitle];
    [self.sNavView addSubview:self.sNavRight];
}

#pragma mark -
#pragma mark EVENT 

- (void)navLeftPressed:(UIButton *)sender{}
- (void)navRightPressed:(UIButton *)sender{}

#pragma mark -
#pragma mark PRIVATE METHD 

#pragma mark -
#pragma mark SERVICE

#pragma mark -
#pragma mark GET

- (UIImageView *)sNavView{
    if (_sNavView) {
        return _sNavView;
    }
    _sNavView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    _sNavView.userInteractionEnabled = YES;
    return _sNavView;
}

- (UILabel *)sNavTitle{
    if (_sNavTitle) {
        return _sNavTitle;
    }
    _sNavTitle = [[UILabel alloc] initWithFrame:CGRectMake(60, 24, [UIScreen mainScreen].bounds.size.width-120, 30)];
    _sNavTitle.textAlignment = NSTextAlignmentCenter;
    _sNavTitle.font = [UIFont systemFontOfSize:18.0f];
    _sNavTitle.textColor = [UIColor blackColor];
    return _sNavTitle;
}
- (UIButton *)sNavLeft{
    if (_sNavLeft) {
        return _sNavLeft;
    }
    _sNavLeft = [[UIButton alloc] initWithFrame:CGRectMake(10, 35/2.0f, 60, 40)];
    _sNavLeft.titleLabel.textAlignment = NSTextAlignmentLeft;
    [_sNavLeft addTarget:self action:@selector(navLeftPressed:) forControlEvents:UIControlEventTouchUpInside];
    return _sNavLeft;
}

- (UIButton *)sNavRight{
    if (_sNavRight) {
        return _sNavRight;
    }
    _sNavRight = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-10-60, 35/2.0f, 60, 40)];
    [_sNavRight addTarget:self action:@selector(navRightPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_sNavRight setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    return _sNavRight;
}
@end
