//
//  HomePageViewController.m
//  华大
//
//  Created by 隆大佶 on 16/9/9.
//  Copyright © 2016年 HangLong Lv. All rights reserved.
//

#import "HomePageViewController.h"
#import "XRCarouselView.h"//图片

#import "HomePageCollectionViewCell.h"

@interface HomePageViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>
@property (strong, nonatomic)  XRCarouselView *headScroView;  //头部滑动视图

@property (strong, nonatomic)  UICollectionView *collectionView;

@property (strong, nonatomic)  NSArray *mainArray;
@property (assign, nonatomic)  BOOL isShowBanner;

@end

@implementation HomePageViewController
// 注意const的位置
static NSString *const cellId = @"cellId";

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
    [self.view addSubview:_collectionView];
    
    // 注册cell、sectionHeader、sectionFooter
    [_collectionView registerClass:[HomePageCollectionViewCell class] forCellWithReuseIdentifier:cellId];
 

}
#pragma mark ---- UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    return self.mainArray.count;
    return 10;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomePageCollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];

    if (!cell) {
        cell=[[HomePageCollectionViewCell alloc]init];
    }
    cell.model=self.mainArray[indexPath.row];

    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];

    return cell;
}




#pragma mark ---- UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        return (CGSize){KScreenWidth-26,120};
    }else{
        if (indexPath.row%3 == 0) {
            return (CGSize){KScreenWidth-26,120};
            
        }else{
            return (CGSize){KScreenWidth*0.5-13-2.5,120};
            
        }

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
//// 选中某item
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}
//
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

@end
