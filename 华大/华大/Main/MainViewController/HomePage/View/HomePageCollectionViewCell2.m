//
//  HomePageCollectionViewCell2.m
//  华大
//
//  Created by 隆大佶 on 16/9/19.
//  Copyright © 2016年 HangLong Lv. All rights reserved.
//

#import "HomePageCollectionViewCell2.h"

@interface HomePageCollectionViewCell2 ()

@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *titleLabel;

 

@property(nonatomic,strong)UIImageView *timeImage;
@property(nonatomic,strong)UIImageView *commentImage;
@property(nonatomic,strong)UIImageView *pensonImage;

@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UILabel *commentLabel;
@property(nonatomic,strong)UILabel *pensonLabel;

@end
@implementation HomePageCollectionViewCell2

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];

        self.imageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageView];
        
        self.timeImage = [[UIImageView alloc]init];
        self.timeImage.image=[UIImage imageNamed:@"iconfont-time"];
        [self.contentView addSubview:self.timeImage];
        
        self.commentImage = [[UIImageView alloc]init];
        self.commentImage.image=[UIImage imageNamed:@"iconfont-message"];
        [self.contentView addSubview:self.commentImage];
        
        self.pensonImage = [[UIImageView alloc]init];
        self.pensonImage.image=[UIImage imageNamed:@"iconfont-my"];
        [self.contentView addSubview:self.pensonImage];
        
        self.timeLabel = [[UILabel alloc]init];
        self.timeLabel.font = [UIFont systemFontOfSize:10];
        self.timeLabel.textColor = KColor(121, 121, 121);
        [self.contentView addSubview:self.timeLabel];
        
        self.commentLabel = [[UILabel alloc]init];
        self.commentLabel.font = [UIFont systemFontOfSize:10];
        self.commentLabel.textColor = KColor(121, 121, 121);
        [self.contentView addSubview:self.commentLabel];
        
        self.pensonLabel = [[UILabel alloc]init];
        self.pensonLabel.font = [UIFont systemFontOfSize:10];
        self.pensonLabel.textColor = KColor(121, 121, 121);
        [self.contentView addSubview:self.pensonLabel];
        
        
        self.titleLabel = [[UILabel alloc]init];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.titleLabel.textColor = KColor(1, 1, 1);
        self.titleLabel.numberOfLines = 2;
        [self.titleLabel sizeToFit];
        [self.contentView addSubview:self.titleLabel];
        
        
        
        
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
    CGFloat width = self.contentView.size.width;
    
    self.titleLabel.frame = CGRectMake(8, 0, width-16, 40);
    
    CGFloat titleLabelY =  (self.frame.size.height-CGRectGetMaxY(self.titleLabel.frame)-120-12)*0.5 + CGRectGetMaxY(self.titleLabel.frame);
    
    self.timeImage.frame = CGRectMake(8, titleLabelY, 12, 12);
    self.timeLabel.frame = CGRectMake(20+1, titleLabelY, 50, 12);
    
    self.commentImage.frame = CGRectMake(70, titleLabelY, 12, 12);
    self.commentLabel.frame = CGRectMake(82, titleLabelY, 50, 12);
    
    self.imageView.frame = CGRectMake(0, self.frame.size.height-120, width, 120);




}

 

@end



