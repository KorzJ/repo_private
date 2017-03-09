

#import <UIKit/UIKit.h>

@interface SDTimeLineCellOperationMenu : UIView

@property (nonatomic, assign, getter = isShowing) BOOL show;

@property (nonatomic, copy) void (^likeButtonClickedOperation)();
@property (nonatomic, copy) void (^commentButtonClickedOperation)();


@end
