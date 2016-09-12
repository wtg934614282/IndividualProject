//
//  FTTMenuVC.m
//  TableView的一些整合
//
//  Created by cmcc on 16/7/28.
//  Copyright © 2016年 cmcc. All rights reserved.
//


#define FTTMenuBtnW          KScreenWidth/ 3
#define FTTMenuSpace         0
#define FTTMenuBtnTag        100
#import "FTTMenuVC.h"
#import "Customkongjian.h"

@interface FTTMenuVC ()<UIScrollViewDelegate>

@property (nonatomic , strong) UIView           *view ;
@property (nonatomic , strong) UIScrollView     *ControllView;
@property (nonatomic , strong) UIScrollView     *TitleScrollView;
@property (nonatomic , strong) NSMutableArray   *VCarray;
@property (nonatomic , strong) NSMutableArray   *TitleArray;
@property (nonatomic , assign) NSInteger        lastSelectBtn;
@end

@implementation FTTMenuVC

- (void)addSubView:(NSArray *)VC SubTitles:(NSArray *)titles {
    self.lastSelectBtn = -1 ;
    self.VCarray    = [NSMutableArray new];
    self.TitleArray = [NSMutableArray new];
    [self.VCarray addObjectsFromArray:VC];
    [self.TitleArray addObjectsFromArray:titles];
    [self initControView];
    
    [self initTitleScrollViewWithTitles:titles];
    
}
// 初始化ControllView
- (void)initControView {
    self.ControllView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.frame), self.superview.frame.size.width, self.superview.frame.size.height - CGRectGetMaxY(self.frame))];
    self.ControllView.delegate = self;
    // 设置是否可以回弹
    self.ControllView.bounces = NO;
    // 偏移量
    self.ControllView.contentSize = CGSizeMake(self.superview.frame.size.width * self.VCarray.count, self.superview.frame.size.height - CGRectGetMaxY(self.frame));
    // 是否显示水平方向的滚动条
    self.ControllView.showsHorizontalScrollIndicator = NO;
    // 是否显示垂直方向的滚动条
    self.ControllView.showsVerticalScrollIndicator = NO;
    // 是否按页翻滚
    self.ControllView.pagingEnabled = YES;
    [self.superview addSubview:self.ControllView];
}
// 初始化TitleScrollView
- (void)initTitleScrollViewWithTitles:(NSArray *)titles {
    self.TitleScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.TitleScrollView.contentSize = CGSizeMake((FTTMenuBtnW + FTTMenuSpace) * titles.count + FTTMenuSpace, self.frame.size.height);
    self.TitleScrollView.showsVerticalScrollIndicator = NO;
    self.TitleScrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.TitleScrollView];
    for (int i = 0 ; i < titles.count; i++) {
        NSInteger tag = self.MenuButtoTag? self.MenuButtoTag : FTTMenuBtnTag;
        UIButton *btn = [Customkongjian createButtonWithFrame:CGRectMake(FTTMenuSpace+ (FTTMenuBtnW + FTTMenuSpace) * i, FTTMenuSpace, FTTMenuBtnW, self.frame.size.height - 1) taeget:self sel:@selector(MenuTitleClick:) tag:tag + i image:nil title:titles[i] textFont:0 adjustsFontSizesTowidth:YES msaksToBounds:NO conrenrRadius:0];
        [btn setTitleColor:self.titleColor forState:UIControlStateNormal];
        btn.titleLabel.font = self.titleFont;
        [self addChildView:self.VCarray[i] title:titles[i]];
        UIColor *sliderColor = self.SliderAndEllipesColor ;
        if (i == 0 ) {
            if (self.MenuVCType == FTTMenuVCEllipse) {
                self.view = [[UIView alloc]initWithFrame:btn.frame];
                self.view.backgroundColor = sliderColor;
                self.view.layer.cornerRadius = 10 ;
                self.view.layer.masksToBounds = YES;
                [self.TitleScrollView addSubview:self.view];
            }
            if (self.MenuVCType == FTTMenuVCSlider) {
                CGRect frame = btn.frame;
                frame.size.height = 1 ;
                frame.origin.y = CGRectGetMaxY(btn.frame);
                self.view = [[UIView alloc]initWithFrame:frame];
                self.view.backgroundColor = sliderColor;
                [self.TitleScrollView addSubview:self.view];
            }
            [self addChildView:i];
        }
        if (i == 1 && self.nextView) {
            [self addChildView:i];
        }
        [self.TitleScrollView addSubview:btn];
        if (i == 0 ) {
            [self changeBtnTitleColorWithTag:i];
        }

    }
    
}
// 视图控制器
- (UIViewController *)findViewController:(UIView *)sourceView {
    id target = sourceView ;
    while (target) {
        target = ((UIResponder *)target).nextResponder;
        if ([target isKindOfClass:[UIViewController class]]) {
            break;
        }
    }
    return target;
}
// 添加子控制器
- (void)addChildView:(UIViewController *)chileVC title:(NSString *)vcTitle {
    UIViewController *superVC = [self findViewController:self];
    chileVC.title = vcTitle;
    [superVC addChildViewController:chileVC];
}
// 添加子控制器视图
- (void)addChildView:(NSInteger)index {
    UIViewController *superVC = [self findViewController:self];
    UIViewController *vc = superVC.childViewControllers[index];
    CGRect frame = self.ControllView.bounds;
    frame.origin.x = self.superview.frame.size.width * index;
    vc.view.frame = frame;
    [self.ControllView addSubview:vc.view];
}
// 按钮点击事件
- (void)MenuTitleClick:(UIButton *)btn {
    NSInteger tag = self.MenuButtoTag ? self.MenuButtoTag : FTTMenuBtnTag ;
    [self changeBtnTitleColorWithTag:btn.tag - tag];
    [self buttonMoveWithIndex:btn.tag - tag];
    [self viewFrameAutoWith:self.view.frame];
    [self addChildView:btn.tag - tag];
    self.ControllView.contentOffset = CGPointMake(self.superview.frame.size.width * (btn.tag - tag), 0);
}
// titleScrollView frame自适应
- (void)viewFrameAutoWith:(CGRect)frame {
    CGRect Tempframe = frame;
    CGFloat MaxX = CGRectGetMaxX(Tempframe);
    CGFloat contentOffX = self.TitleScrollView.contentSize.width - self.TitleScrollView.frame.size.width ;
    CGFloat MinX  = CGRectGetMaxX(Tempframe);
    if (MaxX >= self.superview.frame.size.width - FTTMenuSpace * 2) {
        [self.TitleScrollView setContentOffset:CGPointMake(contentOffX, 0) animated:YES];
    }
    if (MinX - FTTMenuSpace * 2 <= contentOffX) {
        [self.TitleScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}
// 改变按钮字体的颜色
- (void)changeBtnTitleColorWithTag:(NSInteger)tag {
    UIColor *color = self.titleColor ;
    UIColor *selectColor = self.selectTitleColor;
    NSInteger temtag = self.MenuButtoTag ? self.MenuButtoTag : FTTMenuBtnTag;
    if (self.lastSelectBtn >= 0) {
        UIButton *lastBtn = (UIButton *)[self viewWithTag:self.lastSelectBtn + temtag];
        [lastBtn setTitleColor:color forState:UIControlStateNormal];
        lastBtn.titleLabel.font = self.titleFont;
    }
    UIButton *btn = (UIButton *)[self viewWithTag:tag + temtag];
    [btn setTitleColor:selectColor forState:UIControlStateNormal];
    btn.titleLabel.font = self.selectTileFont;
    self.lastSelectBtn = tag;
}
#pragma  mark ---- UIScrollViewDelegate 
// scrollview滚动监听
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger i = self.ControllView.contentOffset.x / self.superview.frame.size.width;
    [self changeBtnTitleColorWithTag:i];
    [self addChildView:i];
    [self buttonMoveWithIndex:i];
    [self viewFrameAutoWith:self.view.frame];
    if (i < self.VCarray.count - 1 && self.nextView) {
        [self addChildView:i + 1];
    }
}
// 滑块移动动画
- (void)buttonMoveWithIndex:(NSInteger)clickIndex{
    [UIView animateWithDuration:0.25 animations:^{
        CGRect tempFrame = self.view.frame;
        tempFrame.origin.x = FTTMenuSpace + (FTTMenuBtnW+ FTTMenuSpace) * clickIndex;
        self.view.frame = tempFrame;
    }];
    
}



@end
