//
//  MovieQueueViewController.h
//  MovieQueue
//
//  Created by Tony Tam on 6/4/14.
//  Copyright (c) 2014 Tony Tam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieQueueViewController : UIViewController <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *movieListTableView;

@end
