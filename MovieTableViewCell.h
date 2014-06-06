//
//  MovieTableViewCell.h
//  MovieQueue
//
//  Created by Tony Tam on 6/5/14.
//  Copyright (c) 2014 Tony Tam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@end
