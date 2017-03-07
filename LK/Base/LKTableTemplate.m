//  Created by KorzJ on 2017/1/1.

//==============================
//代码规范：美，简洁，高内聚，低耦合
//要        点：编码认真，切记心浮气躁
//==============================

#import "LKTableTemplate.h"

#define DefaultCellIdentify @"UITableViewCell"

@interface LKTableTemplate ()<
DZNEmptyDataSetDelegate,
DZNEmptyDataSetSource,
UITableViewDelegate,
UITableViewDataSource>

@end

@implementation LKTableTemplate

@synthesize tableview;

#pragma mark -
#pragma mark Life Cycle

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setupRefresh];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if ([SVProgressHUD isVisible])[SVProgressHUD dismiss];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //默认 第一页
    self.iPage = 1 ;
    self.items = [NSMutableArray array];
    [self.view addSubview:self.tableview];
    // Do any additional setup after loading the view.
}

#pragma mark -
#pragma mark Init

- (NSMutableArray *)numCell{
    if (!_numCell) {
        _numCell = [[NSMutableArray alloc] initWithObjects:NSStringFromClass([UITableViewCell class]), nil];
    }
    return _numCell;
}

- (UITableView *)tableview{
    if (tableview) {
        return tableview;
    }
    tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStyleGrouped];
    
    for (NSString *cell in self.numCell) {
        if ([UINib nibWithNibName:cell bundle:nil]) {
            [tableview registerNib:[UINib nibWithNibName:cell bundle:nil] forCellReuseIdentifier:cell];
        }else{
            [tableview registerClass:NSClassFromString(cell) forCellReuseIdentifier:cell];
        }
    }
    
    [tableview setTableFooterView:[UIView new]];
    [tableview setSeparatorColor:[UIColor clearColor]];
    [tableview setShowsVerticalScrollIndicator:NO];
    [tableview setShowsHorizontalScrollIndicator:NO];
    [tableview setBackgroundColor:[UIColor clearColor]];
    
    tableview.dataSource = self;
    tableview.delegate = self;
    tableview.emptyDataSetSource = self;
    tableview.emptyDataSetDelegate = self;
    
    return tableview;
}

/**
 *  刷新
 */
- (void)setupRefresh
{
    if (!self.ignorePullHeader && !self.tableview.mj_header) {
       MJRefreshNormalHeader *head = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
        head.lastUpdatedTimeLabel.hidden = YES;
        head.stateLabel.font = FONT(13.0f);
        head.stateLabel.hidden = YES;
        self.tableview.mj_header  = head;;
    }
    if (self.ignorePushFooter && !self.tableview.mj_footer) {
        MJRefreshBackNormalFooter *footer =  [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
        footer.stateLabel.hidden = YES;
        footer.automaticallyHidden = YES;
        self.tableview.mj_footer = footer;
    }
}

#pragma mark -
#pragma mark  UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UITableViewCell new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.items[section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.items count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0)return .5;
    return 10.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return .5;
}

#pragma mark -
#pragma mark DZNEmptyDataSetSource

//============================================
//基类，不做空数据处理，子类继承即可
//============================================

#pragma mark -
#pragma mark DZNEmptyDataSetDelegate

- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView{
    [self.tableview.mj_header beginRefreshing];
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView{
    return YES;
}

- (BOOL)emptyDataSetShouldBeForcedToDisplay:(UIScrollView *)scrollView{
    return NO;
}

#pragma mark -
#pragma mark Event

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark Refresh Method

- (void)footerRereshing{}
- (void)headerRereshing{}

#pragma mark -
#pragma mark Private Method

/**
 *  网络状态改变 子类重写
 */
- (void)networdHasChanged{}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
