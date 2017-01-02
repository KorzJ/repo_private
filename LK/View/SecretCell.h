//
//  SecretCell.h
//  9Top
//
//  Created by KorzJ on 2016/11/7.
//  Copyright © 2016年 KorzJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^valid)(BOOL valid,NSString *secret);
@interface SecretCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *input;
@property (weak, nonatomic) IBOutlet UIButton *eye;

@property (nonatomic,copy) valid valid;
- (void)check:(valid)valid;
@end
