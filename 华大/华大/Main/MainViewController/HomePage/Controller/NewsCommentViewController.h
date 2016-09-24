//
//  NewsCommentViewController.h
//  华大
//
//  Created by 隆大佶 on 16/9/20.
//  Copyright © 2016年 HangLong Lv. All rights reserved.
//

#import "BaseviewController.h"

@interface NewsCommentViewController : BaseviewController
@property(nonatomic,copy) NSString *newsID;

@end
/*
 新闻详情接口
 接口请求地址
 http://next.gouaixin.com/jiekou.php?m=Home&c=Index&a=newinfo
 请求方式：post
 请求参数：
 newid  新闻id
 
 返回值：
 {
 "data": {
 "newid": "3132",//新闻id
 "newtitle": "第六届“法辩盟”决赛圆满落幕 我校喜得亚军",//新闻标题
 "newimage": "http://next.gouaixin.com/Public/images/4.png",//新闻封面图
 "bumen": "华大桂声",//新闻来源
 "pinglunnum": "0",//评论数量
 "shijian": "2016-04-21 21:35:25",//发布时间
 "newcontent": "sdasd",//带html格式的新闻内容
 "size": "0"
 },
 "status": {
 "succeed": 1
 }
 }
 
 、
 评论内容接口
 接口请求地址
 http://next.gouaixin.com/jiekou.php?m=Home&c=Index&a=commentlist
 请求方式：post
 请求参数：
 news_id 新闻id
 currentpage  当前页数
 返回值：
 
 
 发送评论接口
 接口请求地址
 http://next.gouaixin.com/jiekou.php?m=Home&c=Index&a=commentadd
 请求方式：post
 请求参数：
 news_id 新闻id
 comment_text 评论内容
 comment_name 评论人昵称
 user_id 评论人id
 
 返回值：
 
 
 
 评论点赞接口
 接口请求地址
 http://next.gouaixin.com/jiekou.php?m=Home&c=Index&a=commentpraise
 请求方式：post
 请求参数：
 news_id 新闻id
 comment_id 评论id
 user_id 点赞人id
 
 返回值：
 
*/
