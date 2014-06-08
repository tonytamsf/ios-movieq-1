//
//  MovieQueueViewController.m
//  MovieQueue
//
//  Created by Tony Tam on 6/4/14.
//  Copyright (c) 2014 Tony Tam. All rights reserved.
//

#import "MovieQueueViewController.h"
#import "MovieTableViewCell.h"
#import "Movie.h"

@interface MovieQueueViewController ()

@property (nonatomic, strong) NSArray *movies;
@end

@implementation MovieQueueViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Movie Q";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.movieListTableView.delegate = self;
    self.movieListTableView.dataSource = self;
    
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=t7anbdt8gp32yvw33cs92zkg&limit=10";
    //NSString *url = @"/tmp/api.json";

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                               NSLog(@"%@", object);
                               self.movies = [Movie moviesWithArray:object[@"movies"]];
                               [self.movieListTableView reloadData];
                           } ];
    
    [self.movieListTableView registerNib:[UINib
                                          nibWithNibName:@"MovieTableViewCell" bundle:nil]
                  forCellReuseIdentifier:@"MovieTableViewCell"];
    self.movieListTableView.rowHeight = 150;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.movies.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieTableViewCell"];
    
    Movie *movie = self.movies[indexPath.row];
    //if (! movie ) { return nil; }
    NSLog(@"movie %@", movie.title);
    NSLog(@"movie %@", movie.synopsis);

    cell.movieTitleLabel.text = movie.title;
    cell.synopsisLabel.text = movie.synopsis;
    return cell;
}




@end
