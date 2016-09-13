 //
//  HomePageCollectionViewCell.m
//  华大
//
//  Created by 隆大佶 on 16/9/13.
//  Copyright © 2016年 HangLong Lv. All rights reserved.
//

#import "HomePageCollectionViewCell.h"
@interface HomePageCollectionViewCell ()

@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *titleLabel;


@property(nonatomic,strong)UIImageView *timeImage;
@property(nonatomic,strong)UIImageView *commentImage;
@property(nonatomic,strong)UIImageView *pensonImage;

@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UILabel *commentLabel;
@property(nonatomic,strong)UILabel *pensonLabel;

@end
@implementation HomePageCollectionViewCell

-(instancetype)init{
    if (self = [super init]) {
            self.imageView = [[UIImageView alloc]init];
            [self.contentView addSubview:self.imageView];

            self.timeImage = [[UIImageView alloc]init];
        self.imageView.image=[UIImage imageNamed:@"已收藏"];
            [self.contentView addSubview:self.timeImage];

            self.commentImage = [[UIImageView alloc]init];
        self.imageView.image=[UIImage imageNamed:@"已收藏"];
            [self.contentView addSubview:self.commentImage];
        
            self.pensonImage = [[UIImageView alloc]init];
        self.imageView.image=[UIImage imageNamed:@"已收藏"];
            [self.contentView addSubview:self.pensonImage];
        
            self.timeLabel = [[UILabel alloc]init];
        self.timeLabel.font = [UIFont systemFontOfSize:13];
        self.timeLabel.textColor = KColor(121, 121, 121);
            [self.contentView addSubview:self.timeLabel];
        
            self.commentLabel = [[UILabel alloc]init];
        self.commentLabel.font = [UIFont systemFontOfSize:13];
        self.commentLabel.textColor = KColor(121, 121, 121);
            [self.contentView addSubview:self.commentLabel];

            self.pensonLabel = [[UILabel alloc]init];
        self.pensonLabel.font = [UIFont systemFontOfSize:13];
        self.pensonLabel.textColor = KColor(121, 121, 121);
            [self.contentView addSubview:self.pensonLabel];

  
            self.titleLabel = [[UILabel alloc]init];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        self.titleLabel.textColor = KColor(121, 121, 121);
            [self.contentView addSubview:self.titleLabel];
        
    }
    return self;
}


-(void)setModel:(HomePageModel *)model{
    
    if (_model!=model) {
        _model=model;
    }
    self.timeLabel.text=_model.title;
    self.commentLabel.text=_model.title;
    self.pensonLabel.text=_model.title;
    self.titleLabel.text=_model.title;

}

-(void)layoutSubviews{
    
}

@end
