//
//  FindVc.m
//  LK
//
//  Created by KorzJ on 2017/3/3.
//  Copyright © 2017年 KorzJ. All rights reserved.
//

#import "FindVc.h"

@interface FindVc ()<DIYImageScrollView>
@property (nonatomic,strong) DIYImageScrollView *imgScroll;
@end

@implementation FindVc

#pragma mark -
#pragma mark LIFE CYCLE

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.dto handleServiceGetBanner];
    
    [self J_initLayout];
    [self rac_addObserver];
}

#pragma mark -
#pragma mark INIT

- (void)J_initLayout{

    //whell placehold
    self.tableview.tableHeaderView = self.imgScroll;
    self.tableview.tableHeaderView.height = 150.f;
    self.tableview.backgroundColor = RGB(249, 249, 249, 1);
    self.tableview.frame= CGRectMake(0, K_NAV_HEIGHT, self.view.width, self.view.height-K_NAV_HEIGHT-self.tabBarController.tabBar.height);
}

- (void)rac_addObserver{
    @weakify(self);
    [[RACObserve(self.dto, banners) filter:^BOOL(id value) {
        @strongify(self);
        return self.dto.banners.count > 0 ? YES : NO;
    }] subscribeNext:^(id x) {
        @strongify(self);
        self.tableview.tableHeaderView = self.imgScroll;
    }];
}

#pragma mark -
#pragma mark GET

- (DIYImageScrollView *)imgScroll{
    if (_imgScroll) {
        _imgScroll = nil;
    }
    CGFloat height = 150;
    _imgScroll  = [[DIYImageScrollView alloc] initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, height)marrImages:self.dto.banners];
    _imgScroll.delegate = self;
    [_imgScroll startScroll];
    return _imgScroll;
}

- (D_Find *)dto{
    if (_dto) {
        return _dto;
    }
    _dto = [[D_Find alloc] init];
    return _dto;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
