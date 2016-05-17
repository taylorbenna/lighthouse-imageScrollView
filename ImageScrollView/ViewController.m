//
//  ViewController.m
//  ImageScrollView
//
//  Created by Taylor Benna on 2016-05-16.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) NSArray *images;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.images = @[
                [UIImage imageNamed:@"Lighthouse-in-Field"],
                [UIImage imageNamed:@"Lighthouse-night"],
                [UIImage imageNamed:@"Lighthouse-zoomed"]
                ];
    
    float width = 0.0;
    
    for (int i = 0; i < self.images.count; i ++) {
        UIImageView *image = [[UIImageView alloc] initWithImage:self.images[i]];
        image.frame = CGRectMake(width, 0, self.view.frame.size.width, self.view.frame.size.height);
        width += self.view.frame.size.width;
        [self.scrollView addSubview:image];
    }
    
    self.scrollView.contentSize = CGSizeMake(width, self.scrollView.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)scrollViewTapped:(UITapGestureRecognizer *)sender {
    [self performSegueWithIdentifier:@"svTapped" sender:self.scrollView];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIScrollView *)sender {
    int index = sender.contentOffset.x / sender.bounds.size.width;
    SecondViewController* sViewController = [segue destinationViewController];
    sViewController.currentImage = self.images[index];
    //userViewController.user = [self.users objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
    
}

@end
