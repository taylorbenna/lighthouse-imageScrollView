//
//  ViewController.m
//  ImageScrollView
//
//  Created by Taylor Benna on 2016-05-16.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *images = @[
                        [UIImage imageNamed:@"Lighthouse-in-Field"],
                        [UIImage imageNamed:@"Lighthouse-night"],
                        [UIImage imageNamed:@"Lighthouse-zoomed"]
                        ];
    
    float width = 0.0;
    
    for (int i = 0; i < images.count; i ++) {
        UIImageView *image = [[UIImageView alloc] initWithImage:images[i]];
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

@end
