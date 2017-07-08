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

@end

@implementation NewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    RAC(self.titleLabel, text) = RACObserve(self, viewModel.title);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setViewModel:(NewsListCellViewModel *)viewModel {
    _viewModel = viewModel;
    
    [self.picImageView sd_setImageWithURL:[NSURL URLWithString:viewModel.images.firstObject] placeholderImage:nil];
}

- (void)lf_bindViewModel:(NewsListCellViewModel *)viewModel {
//    self.viewModel = viewModel;
//    
//    self.titleLabel.text = viewModel.title;
    
    
}

@end
