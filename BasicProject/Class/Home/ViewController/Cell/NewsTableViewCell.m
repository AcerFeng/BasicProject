//
//  NewsTableViewCell.m
//  BasicProject
//
//  Created by LanFeng on 2017/2/26.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "NewsListCellViewModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface NewsTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (nonatomic, strong) NewsListCellViewModel *viewModel;
@end

@implementation NewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)lf_bindViewModel:(NewsListCellViewModel *)viewModel {
    self.viewModel = viewModel;
    
    self.titleLabel.text = viewModel.title;
    [self.picImageView sd_setImageWithURL:[NSURL URLWithString:viewModel.images.firstObject] placeholderImage:nil];
    
}

@end
