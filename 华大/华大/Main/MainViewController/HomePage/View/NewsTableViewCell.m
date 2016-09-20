//
//  NewsTableViewCell.m
//  华大
//
//  Created by 隆大佶 on 16/9/19.
//  Copyright © 2016年 HangLong Lv. All rights reserved.
//

#import "NewsTableViewCell.h"

@interface NewsTableViewCell ()
@property(nonatomic,strong)UIImageView *titleImageView;
@property(nonatomic,strong)UILabel *titleLabel;

@property(nonatomic,strong)UIView *cellbackgroundView;

@property(nonatomic,strong)UIImageView *timeImage;
@property(nonatomic,strong)UIImageView *commentImage;
@property(nonatomic,strong)UIImageView *pensonImage;

@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UILabel *commentLabel;
@property(nonatomic,strong)UILabel *pensonLabel;
@end
@implementation NewsTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.contentView.backgroundColor = KColor(232, 240, 238);
        
        self.cellbackgroundView = [[UIView alloc]init];
        self.cellbackgroundView.frame = CGRectMake(8, 8, KScreenWidth-16, 200-16);
        self.cellbackgroundView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.cellbackgroundView];
        
        self.titleImageView = [[UIImageView alloc]init];
        [self.cellbackgroundView addSubview:self.titleImageView];
        
        self.timeImage = [[UIImageView alloc]init];
        self.timeImage.image=[UIImage imageNamed:@"iconfont-time"];
        [self.cellbackgroundView addSubview:self.timeImage];
        
        self.commentImage = [[UIImageView alloc]init];
        self.commentImage.image=[UIImage imageNamed:@"iconfont-message"];
        [self.cellbackgroundView addSubview:self.commentImage];
        
        self.pensonImage = [[UIImageView alloc]init];
        self.pensonImage.image=[UIImage imageNamed:@"iconfont-my"];
        [self.cellbackgroundView addSubview:self.pensonImage];
        
        self.timeLabel = [[UILabel alloc]init];
        self.timeLabel.font = [UIFont systemFontOfSize:10];
        self.timeLabel.textColor = KColor(121, 121, 121);
        [self.cellbackgroundView addSubview:self.timeLabel];
        
        self.commentLabel = [[UILabel alloc]init];
        self.commentLabel.font = [UIFont systemFontOfSize:10];
        self.commentLabel.textColor = KColor(121, 121, 121);
        [self.cellbackgroundView addSubview:self.commentLabel];
        
        self.pensonLabel = [[UILabel alloc]init];
        self.pensonLabel.font = [UIFont systemFontOfSize:10];
        self.pensonLabel.textColor = KColor(121, 121, 121);
        [self.cellbackgroundView addSubview:self.pensonLabel];
        
        
        self.titleLabel = [[UILabel alloc]init];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.titleLabel.textColor = KColor(1, 1, 1);
        self.titleLabel.numberOfLines = 2;
        [self.titleLabel sizeToFit];
        [self.cellbackgroundView addSubview:self.titleLabel];
        

    }
    return self;
}



-(void)setModel:(HomePageModel *)model{
    
    if (_model!=model) {
        _model=model;
    }
    self.timeLabel.text=_model.shijian;
    self.commentLabel.text=[NSString stringWithFormat:@"评论%@",_model.pinglunnum];
    self.pensonLabel.text=_model.bumen;
    self.titleLabel.text=_model.newtitle;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:_model.newimage]];
    

    
    
}

-(void)layoutSubviews{
    CGFloat width = self.cellbackgroundView.size.width;
    self.imageView.frame = CGRectMake(8, 0, width, 120);
    
    self.titleLabel.frame = CGRectMake(8, CGRectGetMaxY(self.imageView.frame), width-16, 40);
    
    CGFloat titleLabelY =  CGRectGetMaxY(self.titleLabel.frame)+3;
    self.pensonImage.frame = CGRectMake(8, titleLabelY, 12, 12);
    self.pensonLabel.frame = CGRectMake(20+1, titleLabelY, 50, 12);
    self.timeImage.frame = CGRectMake(70, titleLabelY, 12, 12);
    self.timeLabel.frame = CGRectMake(82+1, titleLabelY, 50, 12);
    self.commentImage.frame = CGRectMake(132, titleLabelY, 12, 12);
    self.commentLabel.frame = CGRectMake(144+1, titleLabelY, 50, 12);
    
    
    
    
}



@end
