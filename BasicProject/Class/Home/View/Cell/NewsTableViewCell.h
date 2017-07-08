//
//  NewsTableViewCell.h
//  BasicProject
//
//  Created by LanFeng on 2017/2/26.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewProtocol.h"

@class NewsListCellViewModel;
@interface NewsTableViewCell : UITableViewCell<ViewProtocol>
@property (nonatomic, strong) NewsListCellViewModel *viewModel;
@end
