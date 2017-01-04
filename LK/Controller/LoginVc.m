//  Created by KorzJ on 2017/1/1.

//==============================
//代码规范：美，简洁，高内聚，低耦合
//要        点：编码认真，切记心浮气躁
//==============================

#import "LoginVc.h"
@implementation LoginVc

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
    self.sNavTitle.text = @"登录";
}
- (void)J_initUI{
    [self.tableview setTableHeaderView:[[NSBundle mainBundle]loadNibNamed:@"LoginTopView" owner:nil options:nil][0]];
    self.numCell = (NSMutableArray *)@[@[@"AccountCell",@"SecretCell",@"EmptyCell",@"SignInCell"]];
    [self.tableview registerClass:NSClassFromString(@"EmptyCell") forCellReuseIdentifier:@"EmptyCell"];
    self.items = (NSMutableArray *)@[@[@"",@"",@"",@""]];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellName = self.numCell[indexPath.section][indexPath.row];
    
    @weakify(self);

    if ([cellName isEqualToString:@"EmptyCell"])return [tableView dequeueReusableCellWithIdentifier:@"EmptyCell" forIndexPath:indexPath];
    UITableViewCell *cell = [[NSBundle mainBundle] loadNibNamed:cellName owner:self options:nil][0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([cellName isEqualToString:@"SecretCell"]) {
        SecretCell *secretCell  = (SecretCell *)cell;
        secretCell.textChanged = ^(BOOL valid, NSString *secret){
            self_weak_.dto.passoword = secret;
        };
    }
    
    if ([self.numCell[indexPath.section][indexPath.row] isEqualToString:@"AccountCell"]) {
        AccountCell *accountCell  = (AccountCell *)cell;
        accountCell.textChanged = ^(BOOL valid, NSString *mobile){
            self_weak_.dto.telephone = mobile;
        };
    }
    
    if ([self.numCell[indexPath.section][indexPath.row] isEqualToString:@"SignInCell"]) {
        SignInCell *signCell  = (SignInCell *)cell;
        RAC(signCell.loginBtn,enabled) = [RACObserve(self.dto, vaildInput) map:^id(id value) {
            return value;
        }];
    }
    
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat height = 0;
    
    switch (indexPath.row) {
            case 0:
            height = 60;
            break;
            case 1:
            height = 53;
            break;
            case 2:
            height = 30;
            break;
            case 3:
            height = 93;
            break;
        default:
            break;
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0f;
}

#pragma mark -
#pragma mark EVENT 

#pragma mark -
#pragma mark PRIVATE METHD 

#pragma mark -
#pragma mark SERVICE

#pragma mark -
#pragma mark GET

- (DTO_Login *)dto{
    if (_dto)return _dto;
    _dto = [DTO_Login new];
    return _dto;
}
@end
