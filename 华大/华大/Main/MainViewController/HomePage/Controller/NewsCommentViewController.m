//
//  NewsCommentViewController.m
//  华大
//
//  Created by 隆大佶 on 16/9/20.
//  Copyright © 2016年 HangLong Lv. All rights reserved.
//

#import "NewsCommentViewController.h"
#import "NewsCommentModel.h"
#import "NewsCommentTableViewCell.h"
@interface NewsCommentViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableview;
@property (strong, nonatomic)  NSMutableArray *mainArray;
@property(assign,nonatomic) NSInteger page;
@end
@implementation NewsCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"评论";
    [self initTableView];
    
    [self ButtomView];
}
-(void)ButtomView{
    UIView *buttomView = [[UIView alloc]init];
    buttomView.frame = CGRectMake(0, KScreenHeight-58, KScreenWidth, 58);
//    buttomView.backgroundColor = [UIColor redColor];
    [self.view addSubview:buttomView];
    
    UIView *line1 = [[UIView alloc]init];
    line1.backgroundColor = [UIColor colorWithRed:220/255.f green:220/255.f blue:220/255.f alpha:1.0];
    line1.frame = CGRectMake(0, 0, KScreenWidth, 1);
    [buttomView addSubview:line1];
    
 
    UITextField *textField = [[UITextField alloc]init];
    textField.frame = CGRectMake(8,5,KScreenWidth-8-8, 40);
    textField.placeholder = @"评论";
    textField.font = [UIFont systemFontOfSize:16];
    textField.textColor = [UIColor blackColor];
    textField.clearButtonMode = UITextFieldViewModeUnlessEditing;
    [buttomView addSubview:textField];
    
    UIImageView *image = [[UIImageView alloc]init];
    image.image = [UIImage imageNamed:@"iconfont-xiaoxi"];
    image.contentMode = UIViewContentModeCenter;
    image.frame = CGRectMake(25, 10, 44, 44);
    textField.leftView = image;
    textField.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor colorWithRed:200/255.f green:200/255.f blue:200/255.f alpha:1.0];
    line.frame = CGRectMake(8, 40, KScreenWidth-16, 1);
    [buttomView addSubview:line];
    
}
-(void)initTableView{
    
    self.tableview = [[UITableView alloc] init];
    self.tableview.frame = CGRectMake(0, 0, self.view.frame.size.width, KScreenHeight-58);
    self.tableview.dataSource = self;
    self.tableview.delegate  = self;
    self.tableview.rowHeight = 200;
    self.tableview.backgroundColor = KColor(232, 240, 238);
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableview];
    
    
    
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = NO;
    // 隐藏状态
    header.stateLabel.hidden =NO;
    // 设置普通状态的动画图片
    // [header setImages:idleImages forState:MJRefreshStateIdle];
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    // [header setImages:pullingImages forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    //    [header setImages:refreshingImages2 forState:MJRefreshStateRefreshing];
    // 设置header
    _tableview.mj_header = header;
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    footer.refreshingTitleHidden = NO;
    //    [footer setTitle:@" " forState:MJRefreshStateIdle];
    // 设置刷新图片
    //    [footer setImages:refreshingImages2 forState:MJRefreshStateRefreshing];
    // 设置尾部
    _tableview.mj_footer = footer;
    
    [_tableview.mj_header beginRefreshing];
    
}




//刷新数据
-(void)loadNewData{
    
    
    
    self.page = 0;
    [self.mainArray removeAllObjects];
    [_tableview reloadData];
    
    NSString  *indexUrl = @"http://next.gouaixin.com/jiekou.php?m=Home&c=Index&a=commentlist";
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:self.newsID forKey:@"news_id"];
    [dic setValue:[NSString stringWithFormat:@"%ld",(long)self.page] forKey:@"currentpage"];

    
    //获得请求地址`
    //提交地址和参数
    [GetData requestURL:indexUrl
             httpMethod:@"POST"
                 params:dic
                   file:nil
                success:^(id data) {
                    NSArray *array = [NewsCommentModel mj_objectArrayWithKeyValuesArray:data[@"data"]];
                    //
                    if(array.count > 0){
                        //请求到数据
                        
                        [self.mainArray addObjectsFromArray:array];
                        [_tableview reloadData];
                    }else{
                        
                    }
                    
                    [_tableview.mj_header endRefreshing];
                }
                   fail:^(NSError *error) {
                       [_tableview.mj_header endRefreshing];
                   }];
    
    
    
}
//加载更多
-(void)loadMoreData{
    
    
    self.page++;
    NSString  *indexUrl = @" http://next.gouaixin.com/jiekou.php?m=Home&c=Index&a=commentlist";
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:self.newsID forKey:@"news_id"];
    [dic setValue:self.newsID forKey:@"currentpage"];

    //获得请求地址`
    //提交地址和参数
    [GetData requestURL:indexUrl
             httpMethod:@"POST"
                 params:dic
                   file:nil
                success:^(id data) {
                    NSArray *array = [NewsCommentModel mj_objectArrayWithKeyValuesArray:data[@"data"]];
                    
                    
                    if(array.count > 0){
                        //请求到数据
                        
                        [self.mainArray addObjectsFromArray:array];
                        [_tableview reloadData];
                    }else{
                        
                    }
                    
                    [_tableview.mj_footer endRefreshing];
                    
                }
                   fail:^(NSError *error) {
                       [_tableview.mj_footer endRefreshing];
                   }];
    
}

#pragma mark ---- UItableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.mainArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"Identifier";
    NewsCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(cell == nil) {
        cell = [[NewsCommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
        cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.mainArray[indexPath.row];
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    
//    NewsDetailViewController *news = [[NewsDetailViewController alloc]init];
//    news.hidesBottomBarWhenPushed = YES;    //用来隐藏标签栏
//    [self.navigationController pushViewController:news animated:YES];
//}

-(NSMutableArray *)mainArray{
    if (!_mainArray) {
        _mainArray = [NSMutableArray array];
    }
    return _mainArray;
}
@end
