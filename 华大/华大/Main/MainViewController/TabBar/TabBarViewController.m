//
//  MainViewController.m
//  shangxinda
//
//  Created by cmcc on 16/5/31.
//  Copyright © 2016年 cmcc. All rights reserved.
//

#import "TabBarViewController.h"
#import "TabBarModel.h"
@interface TabBarViewController ()
@property(nonatomic,strong)UIImageView *tabBarView;
@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.translucent = NO;
    self.tabBar.backgroundColor = [UIColor whiteColor];
    NSArray *tabbarModelArray  =[self loadConfigFile];
    [self createViewControllers:tabbarModelArray];
}


//加载配置文件
- (NSArray *)loadConfigFile {
    // 检查一下是否需要使用网络的配置文件，如果需要就去下载，以便下一次使用
    //在这里直接加载本地的配置文件就行了
    
    NSMutableArray *resultArray = [NSMutableArray new];
    
    NSString *filePath= [[NSBundle mainBundle]pathForResource:@"MyTabBar.plist" ofType:nil];
    NSArray *contentArray = [NSArray arrayWithContentsOfFile:filePath];
    
    for (NSDictionary *item in contentArray) {
        TabBarModel *model = [[TabBarModel alloc]init];
        [model setValuesForKeysWithDictionary:item];
        [resultArray addObject:model];
    }
    
    return resultArray;
}
//创建子视图控制器
- (void)createViewControllers:(NSArray *)tabbarModelArray {
    NSMutableArray *resultArray =[NSMutableArray new];
    for (TabBarModel *model in tabbarModelArray) {
        UIViewController *vc = [[NSClassFromString(model.className) alloc]init];
        vc.title = model.title;
        vc.tabBarItem.title = model.title;
        vc.tabBarItem.image = [[UIImage imageNamed:model.image1]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@",model.image2]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBar.tintColor = [UIColor  getColor:@"#a16dda"];

        
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        nav.title = model.title;
        [resultArray addObject:nav];
        
    }
    self.viewControllers = resultArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



@end
