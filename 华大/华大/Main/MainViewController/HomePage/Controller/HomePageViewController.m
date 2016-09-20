//
//  HomePageViewController.m
//  华大
//
//  Created by 隆大佶 on 16/9/9.
//  Copyright © 2016年 HangLong Lv. All rights reserved.
//

#import "HomePageViewController.h"
#import "XRCarouselView.h"//图片
#import "NewsDetailViewController.h"

#import "HomePageCollectionViewCell.h"
#import "HomePageCollectionViewCell2.h"
#import "HomePageModel.h"

@interface HomePageViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>
@property (strong, nonatomic)  XRCarouselView *headScroView;  //头部滑动视图

@property (strong, nonatomic)  UICollectionView *collectionView;

@property (strong, nonatomic)  NSMutableArray *mainArray;
@property (assign, nonatomic)  NSInteger page;
@property (assign, nonatomic)  BOOL isShowBanner;

@end

@implementation HomePageViewController
// 注意const的位置
static NSString *const cellId = @"cellId";
static NSString *const cellId2 = @"cellId2";

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"isShowBanner"]) {
        
    }else{
 
        

    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBanner];
    [self initCollectView];
}


-(void)setBanner{
    [_headScroView startTimer];
    NSArray *headArray = @[@"banner01",@"banner02",@"banner03",@"banner04"];
    NSMutableArray *imageArray = [NSMutableArray array];
    
    for (int i = 0; i < headArray.count ; i++) {
        NSString *ss = headArray[i];
        
        UIImageView *image1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:ss]];
        image1 .frame = CGRectMake(KScreenWidth * i, 0, KScreenWidth, self.headScroView.frame.size.height);
        [self.headScroView addSubview:image1];
        
        UIImage *image = [UIImage imageNamed:ss];
        [imageArray addObject:image];
        
    }
    
    
    
    _headScroView = [XRCarouselView carouselViewWithImageArray:imageArray describeArray:nil];
    
    _headScroView.frame = CGRectMake(0, 64, KScreenWidth, 0.3 * KScreenWidth);
    
    [self.view addSubview:_headScroView];
    //用代理处理图片点击
    
    //    _headScroView.delegate = self;
    
    //设置每张图片的停留时间
    _headScroView.time = 2;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    [_headScroView stopTimer];
}

-(void)initCollectView{
    UICollectionViewFlowLayout *_customLayout = [[UICollectionViewFlowLayout alloc] init]; // 自定义的布局对象
    _customLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
  
    
    CGRect frame = CGRectMake(0, CGRectGetMaxY(self.headScroView.frame), KScreenWidth, kScreenHeight-CGRectGetMaxY(self.headScroView.frame)-49);

    _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:_customLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = KColor(232, 240, 238);
    [self.view addSubview:_collectionView];
    
    // 注册cell、sectionHeader、sectionFooter
    
    
    
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
    _collectionView.mj_header = header;
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    footer.refreshingTitleHidden = NO;
//    [footer setTitle:@" " forState:MJRefreshStateIdle];
    // 设置刷新图片
//    [footer setImages:refreshingImages2 forState:MJRefreshStateRefreshing];
    // 设置尾部
    _collectionView.mj_footer = footer;

    [_collectionView.mj_header beginRefreshing];

}
//刷新数据
-(void)loadNewData{
    self.page = 1;
    [self.mainArray removeAllObjects];
    [_collectionView reloadData];
    
    NSString  *indexUrl = @"http://next.gouaixin.com/jiekou.php?m=Home&c=Index&a=newlist";
    
//    NSString *ktoken = [[NSUserDefaults standardUserDefaults]objectForKey:KTOKEN];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:[NSString stringWithFormat:@"%ld",(long)self.page] forKey:@"page"];
    //获得请求地址`
     //提交地址和参数
     [GetData requestURL:indexUrl
             httpMethod:@"POST"
                 params:dic
                   file:nil
                success:^(id data) {
                    NSArray *array = [HomePageModel mj_objectArrayWithKeyValuesArray:data[@"data"]];
                    
                    if(array.count > 0){
                        //请求到数据
               
                        [self.mainArray addObjectsFromArray:array];
                        [_collectionView reloadData];
                    }else{
                        
                    }
                  
                    [_collectionView.mj_header endRefreshing];

                }
                   fail:^(NSError *error) {
                       [_collectionView.mj_header endRefreshing];
                   }];

}
//加载更多
-(void)loadMoreData{
    
    self.page++;
    NSString  *indexUrl = @"http://next.gouaixin.com/jiekou.php?m=Home&c=Index&a=newlist";
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:[NSString stringWithFormat:@"%ld",(long)self.page] forKey:@"page"];
    //获得请求地址`
    //提交地址和参数
    [GetData requestURL:indexUrl
             httpMethod:@"POST"
                 params:dic
                   file:nil
                success:^(id data) {
                    NSArray *array = [HomePageModel mj_objectArrayWithKeyValuesArray:data[@"data"]];
                  
                    
                    if(array.count > 0){
                        //请求到数据
                        
                        [self.mainArray addObjectsFromArray:array];
                        [_collectionView reloadData];
                    }else{
                        
                    }
                    
                    [_collectionView.mj_footer endRefreshing];
                    
                }
                   fail:^(NSError *error) {
                       [_collectionView.mj_footer endRefreshing];
                   }];


}

#pragma mark ---- UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.mainArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
 

    if (indexPath.row%3 == 0) {
        [_collectionView registerClass:[HomePageCollectionViewCell class] forCellWithReuseIdentifier:cellId];

        HomePageCollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
        cell.model=self.mainArray[indexPath.row];
         cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
        return cell;

    }else{
        [_collectionView registerClass:[HomePageCollectionViewCell2 class] forCellWithReuseIdentifier:cellId2];
        
        HomePageCollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:cellId2 forIndexPath:indexPath];
        cell.model=self.mainArray[indexPath.row];
         cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
        return cell;
    }
    
    
}




#pragma mark ---- UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
//    if (indexPath.row == 0) {NSLog(@"0");
//        return (CGSize){KScreenWidth-26,180};
//        
//    }else{
//        if (indexPath.row%3 == 0) { NSLog(@"0");
//            return (CGSize){KScreenWidth-26,180};
//           
//
//        }else{NSLog(@"1");
//            return (CGSize){KScreenWidth*0.5-13-2.5,180};
//            
//
//        }
//
//    }
    
    if ( indexPath.row%3 == 0) {
        return (CGSize){KScreenWidth-26,180};
    }else  {
         return (CGSize){KScreenWidth*0.5-13-2.5,180};
    }
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 13, 5, 13);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.f;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.f;
}


//
//#pragma mark ---- UICollectionViewDelegate
//
//- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//
//// 点击高亮
//- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
//    cell.backgroundColor = [UIColor greenColor];
//}
//
//
// 选中某item
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NewsDetailViewController *news= [[NewsDetailViewController alloc]init];
    [self.navigationController pushViewController:news animated:YES];
}

//
//// 长按某item，弹出copy和paste的菜单
//- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//
//// 使copy和paste有效
//- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender
//{
//    if ([NSStringFromSelector(action) isEqualToString:@"copy:"] || [NSStringFromSelector(action) isEqualToString:@"paste:"])
//    {
//        return YES;
//    }
//    
//    return NO;
//}
//
////
//- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender
//{
//    if([NSStringFromSelector(action) isEqualToString:@"copy:"])
//    {
//        //        NSLog(@"-------------执行拷贝-------------");
//        [_collectionView performBatchUpdates:^{
//            [_section0Array removeObjectAtIndex:indexPath.row];
//            [_collectionView deleteItemsAtIndexPaths:@[indexPath]];
//        } completion:nil];
//    }
//    else if([NSStringFromSelector(action) isEqualToString:@"paste:"])
//    {
//        NSLog(@"-------------执行粘贴-------------");
//    }
//}

-(NSMutableArray *)mainArray{
    if (!_mainArray) {
        _mainArray = [NSMutableArray array];
    }
    return _mainArray;
}

@end
