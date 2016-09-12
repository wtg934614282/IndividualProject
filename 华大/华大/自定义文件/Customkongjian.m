//
//  Customkongjian.m
//  Customkongjian
//
//  Created by cmcc on 16/5/19.
//  Copyright © 2016年 樊腾腾. All rights reserved.
//

#import "Customkongjian.h"

@implementation Customkongjian

+ (UILabel *)createLableWithFrame:(CGRect)frame text:(NSString *)text font:(CGFloat)font color:(UIColor *)color numberOflines:(NSInteger)num adjustsFontSizesTowidth:(BOOL)sizewidth  clipstoBounds:(BOOL)isclp conrenrRadius:(CGFloat)radius  {
    UILabel *lable = [[UILabel alloc]initWithFrame:frame];
    lable.text = text ;
    lable.numberOfLines = num ;
    lable.textColor = color ;
    // 设置lable字体自动适应 宽度
    lable.adjustsFontSizeToFitWidth = sizewidth ;
    lable.clipsToBounds = isclp  ;
    lable.layer.cornerRadius = radius ;
    lable.font = [UIFont systemFontOfSize:font];
    return lable ;
}

+ (UIButton *)createButtonWithFrame:(CGRect)frame taeget:(id)target sel:(SEL)sel tag:(NSInteger)tag image:(NSString *)image title:(NSString *)title textFont:(CGFloat)font adjustsFontSizesTowidth:(BOOL)sizeWith  msaksToBounds:(BOOL)msak conrenrRadius:(CGFloat)radius {
    UIButton *button = nil ;
    if (image) {
        // 创建图片按钮
        button = [UIButton buttonWithType:UIButtonTypeCustom] ;
        [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal] ;
        if (title) {
            // 图片标题按钮
            [button setTitle:title forState:UIControlStateNormal];
        }
    }else if (title) {
            // 创建标题按钮
            button = [UIButton buttonWithType:UIButtonTypeSystem] ;
            [button setTitle:title forState:UIControlStateNormal] ;
            
    }
    button.titleLabel.adjustsFontSizeToFitWidth = sizeWith;
    button.frame = frame ;
    button.tag = tag ;
    button.layer.masksToBounds = msak;
    button.layer.cornerRadius = radius;
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return button ;
    
}


+ (UIImageView *)createImageViewWithFrame:(CGRect)frame imageName:(NSString *)name userInteractionEnabled:(BOOL)Enabled msaksToBounds:(BOOL)msak conrenrRadius:(CGFloat)radius  {
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:frame ];
    imageview.image = [UIImage imageNamed:name];
    imageview.userInteractionEnabled = Enabled;
    imageview.layer.masksToBounds = msak;
    imageview.layer.cornerRadius = radius;
    
    return imageview ;
}


+ (UITextField *)createTextFielWithFrame:(CGRect)frame placeHoler:(NSString *)string delegate:(id<UITextFieldDelegate>)delegate tag:(NSInteger)tag  borderStyle:(UITextBorderStyle*)borderStyle {
    
    UITextField *tf= [[UITextField alloc]initWithFrame:frame];
    // 设置风格类型
    tf.borderStyle = *borderStyle;
    // 设置背景文字
    tf.placeholder = string ;
    // 设置代理
    tf.delegate = delegate ;
    //设置tag
    tf.tag = tag ;
    
    
    return tf ;
    
}






@end
