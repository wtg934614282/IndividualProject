//
//  NewsDetailViewController.m
//  华大
//
//  Created by 隆大佶 on 16/9/20.
//  Copyright © 2016年 HangLong Lv. All rights reserved.
//

#import "NewsDetailViewController.h"

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithWEb];
 
    [self rightButton];
    
}

#pragma mark - 右边
-(void)rightButton{
     CGFloat width = [self sizeWithText:@"(12)" font:[UIFont systemFontOfSize:12] maxW:MAXFLOAT].width;
    
    UIButton *butr = [UIButton buttonWithType:UIButtonTypeCustom];
    butr.frame = CGRectMake(0, 0, 14+width+6+3, 44);
//    butr.backgroundColor = [UIColor redColor];
    [butr addTarget:self action:@selector(xiaoxi) forControlEvents:UIControlEventTouchUpInside];
    butr.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0,-28 );
    
    
    UIImageView *imageview3 = [[UIImageView alloc]initWithFrame:CGRectMake(3, 14, 14, 16)];
    imageview3.image = [UIImage imageNamed:@"iconfont-xx-xiaoxi"] ;
    [butr addSubview:imageview3];
    //        imageview3.userInteractionEnabled  =NO;
    
    UILabel *lable3 = [[UILabel alloc]init];
    lable3.text = @"(12)";
    lable3.frame = CGRectMake( 3+14+3,14, width, 16);
    lable3.textColor = KColor(102, 102, 102);
    lable3.font = [UIFont systemFontOfSize:12];
    lable3.textAlignment = NSTextAlignmentCenter;
    [butr addSubview:lable3];
    
    

    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:butr];
}

// 字符串高度的计算
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, 10000);
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

-(void)xiaoxi{
    
}



-(void)initWithWEb{
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    UIWebView *web = [[UIWebView alloc]init];
//    web.delegate = self;
    web.frame = CGRectMake(0, 64, KScreenWidth, KScreenHeight-64);
    NSLog(@"self.url = %@", self.url);
    
    NSString *str = [NSString stringWithFormat:@"self.url"];
    NSLog(@"%@",[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]);
    
    //     [self.url stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:[self.url stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]]];
    [self.view addSubview: web];
    [web loadRequest:request];
}

#pragma mark - 网页代理UIWebViewDelegate
//
//-(void)webViewDidStartLoad:(UIWebView *)webView{
//    _HUD = [[MBProgressHUD alloc] initWithView:self.view];
//    [self.view addSubview:_HUD];
////    _HUD.labelText = @"网络请求超时";
////    _HUD.labelFont = [UIFont systemFontOfSize:14];
//    _HUD.mode = MBProgressHUDModeIndeterminate;
//
////    [_HUD showAnimated:YES whileExecutingBlock:^{
////        sleep(2);
////    } completionBlock:^{
////        [HUD removeFromSuperview];
////    }];
//    [_HUD show:YES];
//    WEAKSELF(weakSelf)
//    [UIView animateWithDuration:0.5 animations:^{
//        _holdLab = [[UILabel alloc] initWithFrame:CGRectMake((KScreenWidth-150)/2, KScreenHeight/2+100, 150, 20)];
//        _holdLab.text = @"加载中，请稍等～";
//        _holdLab.textAlignment = NSTextAlignmentCenter;
//        _holdLab.textColor = [UIColor grayColor];
//        [weakSelf.view addSubview:_holdLab];
//    }];
//
//}
//
//-(void)webViewDidFinishLoad:(UIWebView *)webView{
//    [_HUD removeFromSuperview];
//    [_holdLab removeFromSuperview];
//}
//
//-(void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    if (_HUD) {
//        [_HUD removeFromSuperview];
//        [_holdLab removeFromSuperview];
//    }
//}
//
//-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
//    [_holdLab removeFromSuperview];
//    MBProgressHUD *HUDDD = [[MBProgressHUD alloc] initWithView:self.view];
//    [self.view addSubview:HUDDD];
//    HUDDD.labelText = @"网络请求超时,请重试";
//    HUDDD.labelFont = [UIFont systemFontOfSize:14];
//    HUDDD.mode = MBProgressHUDModeText;
//    [HUDDD showAnimated:YES whileExecutingBlock:^{
//        sleep(2);
//    } completionBlock:^{
//        [_HUD removeFromSuperview];
//        [HUDDD removeFromSuperview];
//    }];
//}

@end
