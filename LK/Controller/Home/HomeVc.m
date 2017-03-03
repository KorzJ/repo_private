//
//  HomeVc.m
//  LK
//
//  Created by KorzJ on 2017/3/3.
//  Copyright © 2017年 KorzJ. All rights reserved.
//

#import "HomeVc.h"

@class FindVc;
@class IssueVc;
@class POIVc;
@class PersonVc;
@class BBSVc;

@interface HomeVc ()<UITabBarControllerDelegate>
@property (nonatomic, strong)
NSMutableArray *arryVC,*controllers;

@property (nonatomic,assign) NSUInteger index;
@end

@implementation HomeVc

#pragma mark -
#pragma mark LIFE CYCLE

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupViewController];
}

#pragma mark -
#pragma mark Init

+ (instancetype)sharedManger
{
    static dispatch_once_t once;
    static HomeVc * sharedManger;
    dispatch_once(&once, ^{
        if (!sharedManger) {
            sharedManger = [[HomeVc alloc] init];
        }
    });
    return sharedManger;
}

- (NSArray *)controllers{
    
    if (!_controllers) {
        
        _controllers = [NSMutableArray arrayWithObjects:
                        @{@"viewController":@"FindVc",
                          @"title":@"找",
                          @"selectImage":@"finding",
                          @"unselectImage":@"find_unselect"},
                        @{@"viewController":@"BBSVc",
                          @"title":@"知道",
                          @"selectImage":@"know_select",
                          @"unselectImage":@"know_unselect"},
                        @{@"viewController":@"IssueVc",
                          @"title":@"发布",
                          @"selectImage":@"publish_now",
                          @"unselectImage":@"publish_now"},
                        @{@"viewController":@"POIVc",
                          @"title":@"服务",
                          @"selectImage":@"service_now",
                          @"unselectImage":@"service_unselect"},
                        @{@"viewController":@"PersonVc",
                          @"title":@"我",
                          @"selectImage":@"me_now",
                          @"unselectImage":@"me_unselect"},nil];
    }
    return _controllers;
}

- (NSMutableArray *)arryVC{
    
    if (!_arryVC) {
        _arryVC = [[NSMutableArray alloc] init];
    }
    return _arryVC;
}

#pragma mark -
#pragma mark Setup

- (void)setupViewController
{
    for (NSDictionary *item in self.controllers) {
        
        UIViewController *controller = [[NSClassFromString(item[@"viewController"]) alloc]init];
        
        controller.tabBarItem = [[UITabBarItem alloc]initWithTitle:item[@"title"] image:[self originalImage:item[@"unselectImage"]] selectedImage:[self originalImage:item[@"selectImage"]]];
        
        [controller.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       FONT(13.0f),NSFontAttributeName, nil]
                                             forState:UIControlStateNormal];
        if ([item[@"viewController"] isEqualToString:@"IssueVc"]) {
            controller.tabBarItem.imageInsets = UIEdgeInsetsMake(-10, 0, 10, 0);
        }
        [self.arryVC addObject:controller];
    }
    
    self.delegate = self;
    self.viewControllers = self.arryVC;
//    self.tabBar.tintColor = COLORE_SYSTEM;
    self.tabBar.backgroundColor = RGB(255, 255, 255, 1);
    self.tabBar.translucent  = NO;
    self.selectedIndex  = 0;
    
    [self.tabBar setShadowImage:[UIImage new]];
    [self.tabBar setBackgroundImage:[[UIImage alloc]init]];
    [self tabBarController:self didSelectViewController:self.arryVC[0]];
    
}

#pragma mark -
#pragma mark TabBarControllerDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if (tabBarController.selectedIndex == 2) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        if ([LoginUserInfo sharedLoginUserInfo].cargoOwner) {
            UIViewController *controller = [story instantiateViewControllerWithIdentifier:@"PublishViewController"];
            [self.navigationController pushViewController:controller animated:YES];
        }else{
            UIViewController *controller = [story instantiateViewControllerWithIdentifier:@"CarPublishViewController"];
            [self.navigationController pushViewController:controller animated:YES];
        }
        tabBarController.selectedIndex = self.index;
        return;
    }
    self.index = tabBarController.selectedIndex;
    viewController.tabBarItem.title = self.controllers[self.index][@"title"];
    
}

#pragma mark -
#pragma mark PrivateMethod

-(UIImage *)originalImage:(NSString *)image{
    return [IMG(image) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (void)pushIndentifyCertif{
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *controller = [story instantiateViewControllerWithIdentifier:@"CertificateDeatilVC"];
    [self.navigationController pushViewController:controller animated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"appearNoCertif" object:nil];
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
