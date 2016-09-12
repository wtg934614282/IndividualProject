//
//  GetData.h
//  静态文件demo
//
//  Created by 隆大佶 on 16/3/23.
//  Copyright © 2016年 HangLong Lv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface GetData : NSObject





/**
 *  数据请求
 *
 *  @param urlstring URL
 *  @param method    get or Post
 *  @param parmas    请求参数
 *  @param files     请求文件(图片)
 *  @param success   请求成功的block
 *  @param fail      请求失败的block
 */


+ (void)requestURL:(NSString *)requestURL
        httpMethod:(NSString *)method
            params:(NSMutableDictionary *)parmas
              file:(NSDictionary *)files
           success:(void (^)(id data))success
              fail:(void (^)(NSError *error))fail;


@end
