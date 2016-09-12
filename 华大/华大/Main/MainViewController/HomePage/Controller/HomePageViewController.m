//
//  HomePageViewController.m
//  华大
//
//  Created by 隆大佶 on 16/9/9.
//  Copyright © 2016年 HangLong Lv. All rights reserved.
//

#import "HomePageViewController.h"
#import "XRCarouselView.h"//图片

@interface HomePageViewController ()
@property (strong, nonatomic)  XRCarouselView *headScroView;  //头部滑动视图

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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



@end
