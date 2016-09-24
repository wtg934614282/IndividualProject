//
//  NewsCommentTableViewCell.m
//  华大
//
//  Created by 隆大佶 on 16/9/20.
//  Copyright © 2016年 HangLong Lv. All rights reserved.
//

#import "NewsCommentTableViewCell.h"

@interface NewsCommentTableViewCell ()


@property(nonatomic,strong)UIView *cellbackgroundView;

@property(nonatomic,strong)UIButton *zanButton;

@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *commentLabel;
@property(nonatomic,strong)UILabel *numberLabel;

@end


@implementation NewsCommentTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.contentView.backgroundColor = KColor(232, 240, 238);

        self.cellbackgroundView = [[UIView alloc]init];
        self.cellbackgroundView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.cellbackgroundView];
        
 
        
        self.zanButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.zanButton setImage:[UIImage imageNamed:@"iconfont-pl-dianzan"] forState:UIControlStateNormal];
        self.zanButton.frame = CGRectMake(10, 10, 20, 20);
        [self.cellbackgroundView addSubview:self.zanButton];

        self.commentLabel = [[UILabel alloc]init];
        self.commentLabel.font = [UIFont systemFontOfSize:10];
        self.commentLabel.textColor = KColor(121, 121, 121);
        [self.cellbackgroundView addSubview:self.commentLabel];
        
        self.numberLabel = [[UILabel alloc]init];
        self.numberLabel.font = [UIFont systemFontOfSize:10];
        self.numberLabel.textColor = KColor(121, 121, 121);
        [self.cellbackgroundView addSubview:self.numberLabel];
        
        
        self.titleLabel = [[UILabel alloc]init];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.titleLabel.textColor = KColorMainGreen;
        self.titleLabel.numberOfLines = 2;
        [self.titleLabel sizeToFit];
        [self.cellbackgroundView addSubview:self.titleLabel];
        
        
    }
    return self;
}



-(void)setModel:(NewsCommentModel *)model{
    
    if (_model!=model) {
        _model=model;
    }
//    self.timeLabel.text=_model.shijian;
//    self.commentLabel.text=[NSString stringWithFormat:@"评论%@",_model.pinglunnum];
//    self.numberLabel.text=_model.bumen;
//    self.titleLabel.text=_model.newtitle;
//    
//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:_model.newimage]];
    
    
    
    
}

-(void)layoutSubviews{
    
    self.cellbackgroundView.frame = CGRectMake(8, 8, KScreenWidth-16, 200-16);

    
    CGFloat width = self.cellbackgroundView.size.width;
    self.imageView.frame = CGRectMake(8, 0, width, 120);
    
    self.titleLabel.frame = CGRectMake(8, CGRectGetMaxY(self.imageView.frame), width-16, 40);
    
    CGFloat titleLabelY =  CGRectGetMaxY(self.titleLabel.frame)+3;
//    self.pensonImage.frame = CGRectMake(8, titleLabelY, 12, 12);
//    self.numberLabel.frame = CGRectMake(20+1, titleLabelY, 50, 12);
//    self.timeImage.frame = CGRectMake(70, titleLabelY, 12, 12);
//    self.timeLabel.frame = CGRectMake(82+1, titleLabelY, 50, 12);
//    self.commentImage.frame = CGRectMake(132, titleLabelY, 12, 12);
//    self.commentLabel.frame = CGRectMake(144+1, titleLabelY, 50, 12);
//    
    
    
    
}

// 字符串高度的计算
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, 10000);
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

@end
