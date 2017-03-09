
#import "SDBaseTableViewController.h"

@interface SDBaseTableViewController ()

@end

@implementation SDBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}

@end
