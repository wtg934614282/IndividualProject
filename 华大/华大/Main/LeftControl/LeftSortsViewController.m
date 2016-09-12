//
//  LeftSortsViewController.m
//  LGDeckViewController
//
//  Created by jamie on 15/3/31.
//  Copyright (c) 2015年 Jamie-Ling. All rights reserved.
//

#import "LeftSortsViewController.h"
#import "AppDelegate.h"
#import "otherViewController.h"

#import "TabBarViewController.h"

#define KColor(a,b,c)  [UIColor colorWithRed:a/255.f green:b/255.f blue:c/255.f alpha:1.0]

@interface LeftSortsViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation LeftSortsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initButtomView];
    
//    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    imageview.image = [UIImage imageNamed:@"leftbackiamge"];
//    [self.view addSubview:imageview];
    self.view.backgroundColor = KColorMainGreen;
    
    UITableView *tableview = [[UITableView alloc] init];
    self.tableview = tableview;
    tableview.frame = self.view.bounds;
    tableview.dataSource = self;
    tableview.delegate  = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
    
    
    
}

-(void)initButtomView{
    UIView *buttom = [[UIView alloc]init];
    buttom.frame = CGRectMake(0, kScreenHeight - 49, self.view.bounds.size.width, 49);
    buttom.backgroundColor = [UIColor colorWithRed:51/215.f green:51/255.f blue:51/255.f alpha:1.0];
    [self.view addSubview:buttom];
    //灰色的线
    [self returnLineWithFram:CGRectMake(0, 0, self.view.bounds.size.width, 1) superView:buttom color:KColor(130, 130, 130)];
    //三个按钮

    [buttom addSubview:[self addButonWithIndex:0 title:@"设置" imageName:@"set"]];
    [buttom addSubview:[self addButonWithIndex:1 title:@"登陆" imageName:@"set"]];
    [buttom addSubview:[self addButonWithIndex:2 title:@"搜索" imageName:@"set"]];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
//    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
//    }
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:20.0f];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"通知";
        [self returnLineWithFram:CGRectMake(0, 43, self.view.bounds.size.width, 1) superView:cell.contentView color:KColor(28, 91, 149)];

    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"新闻";
        [self returnLineWithFram:CGRectMake(0, 43, self.view.bounds.size.width, 1) superView:cell.contentView color:KColor(28, 91, 149)];

    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"查询课表";
        [self returnLineWithFram:CGRectMake(0, 43, self.view.bounds.size.width, 1) superView:cell.contentView color:KColor(28, 91, 149)];

    } else if (indexPath.row == 3) {
        cell.textLabel.text = @"校历";
        [self returnLineWithFram:CGRectMake(0, 43, self.view.bounds.size.width, 1) superView:cell.contentView color:KColor(28, 91, 149)];

    } else if (indexPath.row == 4) {
        cell.textLabel.text = @"请假";
        [self returnLineWithFram:CGRectMake(0, 43, self.view.bounds.size.width, 1) superView:cell.contentView color:KColor(28, 91, 149)];

    } else if (indexPath.row == 5) {
        cell.textLabel.text = @"黄页";
        [self returnLineWithFram:CGRectMake(0, 43, self.view.bounds.size.width, 1) superView:cell.contentView color:KColor(28, 91, 149)];

    } else if (indexPath.row == 6) {
        cell.textLabel.text = @"证明";
        [self returnLineWithFram:CGRectMake(0, 43, self.view.bounds.size.width, 1) superView:cell.contentView color:KColor(28, 91, 149)];

    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC openLeftViewWithAnimated:NO];//打开左侧抽屉


    otherViewController *vc = [[otherViewController alloc] init];
    //    [tempAppDelegate.mainNavigationController pushViewController:vc animated:NO];
    UINavigationController *nacv = [[UINavigationController alloc]initWithRootViewController:vc];
    nacv.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nacv animated:YES completion:nil];

    
    
    
//    CATransition *animation = [CATransition animation];
//    animation.duration = 0.2;
//    animation.timingFunction = UIViewAnimationCurveEaseInOut;
////    animation.type = @"pageCurl";
//    animation.type = kCATransitionPush;
//    animation.subtype = kCATransitionFromRight;
//    [self.view.window.layer addAnimation:animation forKey:nil];
//    [self presentViewController:nacv animated:YES completion:nil];
    
    
    
    
//    if(indexPath.row == 1) {
 
//    }else if (indexPath.row == 2){
//
//    }else if (indexPath.row == 3){
//        
//    }
}


//头视图
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableview.bounds.size.width, 100)];
    
   
    view.backgroundColor = [UIColor clearColor];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"login_logo"]];
    imageView.frame = CGRectMake(30,20, 70, 70);
    [view addSubview:imageView];
    return view;
}


-(UIView *)returnLineWithFram:(CGRect)frame superView:(UIView *)view color:(UIColor*)color{
    UIView *line = [[UIView alloc]init];
    line.frame = frame;
    line.backgroundColor = color;
    [view addSubview:line];
    return line;
}

-(UIButton*)addButonWithIndex:(NSInteger)Index title:(NSString*)title imageName:(NSString*)imageNmae
{
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];;
    btn3.frame = CGRectMake( 30 + Index * 60 , 0 ,49 , 49);
    btn3.tag = 100 + Index ;
    [btn3 addTarget:self action:@selector(btnpressed:) forControlEvents:UIControlEventTouchUpInside];

    
    UIImageView *imageview3 = [[UIImageView alloc]initWithFrame:CGRectMake(12, 5, 25, 25)];
    imageview3.userInteractionEnabled  = YES ;
    imageview3.image = [UIImage imageNamed:imageNmae] ;
    [btn3 addSubview:imageview3];
//    [btn3 setBackgroundImage:[UIImage imageWithColor:[[UIColor grayColor]colorWithAlphaComponent:0.3]] forState:UIControlStateHighlighted];
    
    
    UILabel *lable3 = [[UILabel alloc]initWithFrame:CGRectMake(0 ,49-14, 49, 12)];
    lable3.text = title;
    lable3.textColor = KColor(102, 102, 102);
    lable3.font = [UIFont systemFontOfSize:12];
    lable3.textAlignment = NSTextAlignmentCenter;
    [btn3 addSubview:lable3];
    return btn3;
}
-(void)btnpressed:(UIButton *)sender{
    if (sender.tag == 100) {
        
    }
}

@end
