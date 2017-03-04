//
//  ImageScrollView.h
//  Ios_HYCom_Demo
//
//  Created by 姚碧波 on 15/8/15.
//  Copyright (c) 2015年 BourneYao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DIYImageScrollView;

@protocol DIYImageScrollView <NSObject>

@optional
-(void)ImageScrollUserClickedAtPage:(NSInteger)currentPage;
-(void)ImageScroll:(DIYImageScrollView *)imageScrollView UserClickedAtPage:(NSInteger)currentPage;

@end

@interface DIYImageScrollView : UIView<UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *marrImageList;//广告页图片
@property (nonatomic) BOOL bNeedStopScrollWithOnePic;//是否需在仅有一张广告页是禁止滚动
@property (nonatomic, strong) UIPageControl  *pageControl;
@property (nonatomic, retain) id<DIYImageScrollView>delegate;
@property (nonatomic)BOOL bNeedImageScroll;//(不需要的参数：不影响应用)

- (UIView *)initWithFrame:(CGRect)frame marrImages:(NSMutableArray *)marrImages;
- (void)startScroll;
- (void)stopScroll;

@end
