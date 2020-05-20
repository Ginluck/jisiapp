//
//  GongFengOnewViewController.m
//  IOS-PROJECT-TEMPLATE
//
//  Created by Apple on 2020/5/9.
//  Copyright © 2020 梦境网络. All rights reserved.
//

#import "GongFengOnewViewController.h"
#import "GongFengOneTableViewCell.h"
#import "GongPinDetialViewController.h"
@interface GongFengOnewViewController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray  * dataAry ;
@property(nonatomic,assign)NSInteger  page;

@end

@implementation GongFengOnewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
       [self regisNib];
       self.tableView.mj_header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
           [self postDate];
       }];
       self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
           self.page = self.page + 1;
           [self refreshPostData];
           
       }];
    // Do any additional setup after loading the view from its nib.
}
-(UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height-kNavagationBarH-44) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.emptyDataSetSource =self;
        _tableView.emptyDataSetDelegate=self;
        _tableView.backgroundColor =kBGViewCOLOR;
        _tableView.showsVerticalScrollIndicator = NO;
        if (@available(iOS 11, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _tableView;
}

-(void)regisNib
{
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([GongFengOneTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([GongFengOneTableViewCell class])];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    GongFengOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GongFengOneTableViewCell class]) forIndexPath:indexPath];
    cell.selectionStyle  =UITableViewCellSeparatorStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GongPinDetialViewController *GPDVC=[GongPinDetialViewController new];
    [self.navigationController pushViewController:GPDVC animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return .1;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}
-(void)endRefresh
{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}
#pragma mark -- 设置暂无数据背景

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"无数据"];
}
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return YES;
}
-(NSMutableArray *)dataAry
{
    if (!_dataAry) {
        _dataAry =[NSMutableArray new];
    }
    return _dataAry;
}
-(void)postDate
{
    self.page = 1;
    [self.dataAry removeAllObjects];
    [self refreshPostData];
}
-(void)refreshPostData
{
    
    //    NSDictionary * param =@{@"pageNum":@(self.page),@"pageRow":@"10",@"status":@"1",@"isApp":@"1"};
    //    [RequestHelp POST:GET_HOUSESALE_URL parameters:param success:^(id result) {
    //        DLog(@"%@",result);
    //        [self.dataAry addObjectsFromArray:[NSArray yy_modelArrayWithClass:[HouseSaleInfo class] json:result[@"list"]]];
    //        [self.tableView reloadData];
    //        [self endRefresh];
    //    } failure:^(NSError *error) {
    //        [self endRefresh];
    //    }];
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
