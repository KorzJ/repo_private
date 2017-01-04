//
//  AccountCell.h
//  9Top
//
//  Created by KorzJ on 2016/11/7.
//  Copyright © 2016年 KorzJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^valid)(BOOL valid,NSString *mobile);
typedef void (^codeBtnClick)();


@interface AccountCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *codeBtn;
@property (weak, nonatomic) IBOutlet UITextField *telInput;

@property (nonatomic,copy) void(^textChanged)(BOOL valid,NSString *mobile);
@end
