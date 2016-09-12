//
//  Customkongjian.h
//  Customkongjian
//
//  Created by cmcc on 16/5/19.
//  Copyright © 2016年 樊腾腾. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Customkongjian : NSObject


/**
 *  创建lable
 *
 *  @param frame     lable 的frame
 *  @param text      lable.text 文字
 *  @param font      字体的大小
 *  @param color     字体的颜色
 *  @param num       行数
 *  @param sizewidth 是否自动适应宽度
 *  @param isclp     是否允许切圆
 *  @param radius    圆边角的大小
 *
 *  @return 返回lable
 */
+ (UILabel *)createLableWithFrame:(CGRect)frame text:(NSString *)text font:(CGFloat)font    color:(UIColor *)color numberOflines:(NSInteger)num adjustsFontSizesTowidth:(BOOL)sizewidth  clipstoBounds:(BOOL)isclp conrenrRadius:(CGFloat)radius  ;

// 创建button
+ (UIButton *)createButtonWithFrame:(CGRect)frame taeget:(id)target sel:(SEL)sel tag:(NSInteger)tag image:(NSString *)image title:(NSString *)title textFont:(CGFloat)font adjustsFontSizesTowidth:(BOOL)sizeWith  msaksToBounds:(BOOL)msak conrenrRadius:(CGFloat)radius ;

// 创建UIImageView
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame imageName:(NSString *)name userInteractionEnabled:(BOOL)Enabled msaksToBounds:(BOOL)msak conrenrRadius:(CGFloat)radius ;

//创建 UItextfield
+ (UITextField *)createTextFielWithFrame:(CGRect)frame placeHoler:(NSString *)string delegate:(id<UITextFieldDelegate>)delegate tag:(NSInteger)tag  borderStyle:(UITextBorderStyle*)borderStyle ;












@end
