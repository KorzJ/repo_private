//
//  UIView+Additions.h
//  EQP
//
//  Created by Cai Wenshu on 8/14/13.
//  Copyright (c) 2013 Liu Ce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Additions)

- (id) initWithParent:(UIView *)parent;
+ (id) viewWithParent:(UIView *)parent;

// Position of the top-left corner in superview's coordinates
@property CGPoint position;
@property CGFloat x;
@property CGFloat y;
@property CGFloat top;
@property CGFloat bottom;
@property CGFloat left;
@property CGFloat right;

// makes hiding more logical
@property BOOL	visible;


// Setting size keeps the position (top-left corner) constant
@property CGSize size;
@property CGFloat width;
@property CGFloat height;

@end
