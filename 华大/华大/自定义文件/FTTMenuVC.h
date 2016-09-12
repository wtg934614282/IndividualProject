//
//  FTTMenuVC.h
//  TableView的一些整合
//
//  Created by cmcc on 16/7/28.
//  Copyright © 2016年 cmcc. All rights reserved.
//

#import <UIKit/UIKit.h>




typedef enum {
    // 细线
    FTTMenuVCSlider  = 0,
    // 椭圆
    FTTMenuVCEllipse = 1,
}FTTMenuVCType;
@interface FTTMenuVC : UIView
/**
 *  未选中字体大小
 */
@property (nonatomic , strong) UIFont        *titleFont;
/**
 *  选中时字体大小
 */
@property (nonatomic , strong) UIFont        *selectTileFont;
/**
 *  未选择时字体的颜色
 */
@property (nonatomic , strong) UIColor       *titleColor;
/**
 *  选择字体时的颜色
 */
@property (nonatomic , strong) UIColor       *selectTitleColor;
/**
 *  细线和椭圆的颜色
 */
@property (nonatomic , strong) UIColor       *SliderAndEllipesColor;
/**
 *  是否提前加载下一个视图
 */
@property (nonatomic , assign) BOOL          nextView;
/**
 *  滑块的样式
 */
@property (nonatomic , assign) FTTMenuVCType MenuVCType;
/**
 *  控制中button的tag赋值(防止与其他tag有冲突)
 */
@property (nonatomic , assign) NSInteger     MenuButtoTag;


/**
 *  导入数据
 */
- (void)addSubView:(NSArray *)VC SubTitles:(NSArray *)titles;

@end
