//
//  WebView.m
//  大学帮帮1.0
//
//  Created by 隆大佶 on 16/1/27.
//  Copyright © 2016年 隆大佶. All rights reserved.
//

#import "WebView.h"


@interface WebView ()<UIWebViewDelegate>
@end

@implementation WebView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initWithWEb];
    if (![self.FROM isEqualToString:@"click_web_url"]) {
   

        self.title = @"任务详情";
    }
   

}

#pragma mark - 右边
-(void)rightButton{
    UIButton *butr = [UIButton buttonWithType:UIButtonTypeCustom];
    butr.frame = CGRectMake(0, 0, 50, 40);
    [butr addTarget:self action:@selector(report) forControlEvents:UIControlEventTouchUpInside];
    [butr setImage:[UIImage imageNamed:@"icon_more"] forState:UIControlStateNormal];
    butr.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0,-30 );
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:butr];
}

-(void)report{
 
}



-(void)initWithWEb{
    self.automaticallyAdjustsScrollViewInsets=NO;

    UIWebView *web = [[UIWebView alloc]init];
    web.delegate = self;
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
