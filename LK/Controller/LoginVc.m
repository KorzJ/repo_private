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

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self J_initNavBar];
    [self J_initUI];
    [self J_initRacObvser];
}

#pragma mark -
#pragma mark INIT

- (void)J_initNavBar{
    self.sNavTitle.text = @"登录";
}

- (void)J_initUI{
    UIImageView *bg = [[UIImageView alloc] initWithImage:IMG(@"on_page")];
    [bg setFrame:(CGRect){0,K_NAV_HEIGHT,K_SCREEN_WIDTH,K_SCREEN_HEIGHT-K_NAV_HEIGHT}];
    [self.view insertSubview:bg belowSubview:self.tableview];
    
    [self.tableview setTableHeaderView:[[NSBundle mainBundle]loadNibNamed:@"LoginTopView" owner:nil options:nil][0]];
    [self.tableview registerClass:NSClassFromString(@"EmptyCell") forCellReuseIdentifier:@"EmptyCell"];
    
    self.items = (NSMutableArray *)@[@[@"",@"",@"",@""]];
    self.numCell = (NSMutableArray *)@[@[@"AccountCell",@"SecretCell",@"EmptyCell",@"SignInCell"]];
}

- (void)J_initRacObvser{
    [RACObserve(self.dto, success_code) subscribeNext:^(id x) {
        if (![x boolValue])
            return;
    }];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellName = self.numCell[indexPath.section][indexPath.row];
    
    if ([cellName isEqualToString:@"EmptyCell"])
        return [tableView dequeueReusableCellWithIdentifier:@"EmptyCell" forIndexPath:indexPath];
    
    UITableViewCell *cell = [[NSBundle mainBundle] loadNibNamed:cellName owner:self options:nil][0];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    if ([cellName isEqualToString:@"SecretCell"])
        return [self configSecretCell:(SecretCell *)cell indexPath:indexPath];
    if ([self.numCell[indexPath.section][indexPath.row] isEqualToString:@"AccountCell"])
        return [self configAccountCell:(AccountCell *)cell indexPath:indexPath];
    if ([self.numCell[indexPath.section][indexPath.row] isEqualToString:@"SignInCell"])
        return [self configSignCell:(SignInCell *)cell indexPath:indexPath];
    
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
            height = 60;
            break;
            case 2:
            height = 30;
            break;
            case 3:
            height = 50;
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

- (AccountCell *)configAccountCell:(AccountCell *)cell indexPath:(NSIndexPath *)indexPath{
    @weakify(self);
    cell.textChanged
    = ^(BOOL valid, NSString *mobile){
        self.dto.telephone = mobile;
    };
    return cell;
}

- (SignInCell *)configSignCell:(SignInCell *)cell indexPath:(NSIndexPath *)indexPath{
    @weakify(self);
    RAC(cell.loginBtn,enabled)
    = [RACObserve(self.dto, vaildInput) map:^id(id value) {
        return value;
    }];
    cell.signInClick = ^(){
        [self.dto loginWithTelephone:@"" password:@""];
    };
    return cell;
}

- (SecretCell *)configSecretCell:(SecretCell *)cell indexPath:(NSIndexPath *)indexPath{
    @weakify(self);
    cell.textChanged
    =  ^(BOOL valid, NSString *secret){
        self.dto.passoword = secret;
    };
    return cell;
}

#pragma mark -
#pragma mark SERVICE

#pragma mark -
#pragma mark GET

- (D_Login *)dto{
    if (_dto)
        return _dto;
    _dto = [D_Login new];
    return _dto;
}

- (void)dealloc{
    self.dto = nil;
}
@end
