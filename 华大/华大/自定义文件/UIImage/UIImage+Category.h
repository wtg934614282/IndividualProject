//
//  UIImage+Category.h
//  大学帮帮-企业版
//
//  Created by 隆大佶 on 16/7/29.
//  Copyright © 2016年 HangLong Lv. All rights reserved.
//




                                       

#import <UIKit/UIKit.h>

@interface UIImage (Category)
//根绝颜色生成图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
