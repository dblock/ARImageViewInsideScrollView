//
//  ARViewController.m
//  ARImageViewInsideScrollView
//
//  Created by Daniel Doubrovkine on 6/1/14.
//  Copyright (c) 2014 Artsy. All rights reserved.
//

#import "ARViewController.h"

@interface ARViewController ()
@property(nonatomic, strong, readonly) UIScrollView *scrollView;
@property(nonatomic, strong, readonly) UIImageView *imageView;
@end

@implementation ARViewController

- (void)viewDidLoad
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    _scrollView = scrollView;

    UIImage *image = [UIImage imageNamed:@"boy.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    _imageView = imageView;
    
    [scrollView addSubview:imageView];
    scrollView.contentSize = image.size;
    
    [self centerOnPoint:CGPointMake(image.size.width / 2, image.size.height / 2) animated:YES];
}

- (void)centerOnPoint:(CGPoint)point animated:(BOOL)animate
{
    CGFloat x = point.x - (self.view.frame.size.width / 2.0f);
    CGFloat y = point.y - (self.view.frame.size.height / 2.0f);
    [self.scrollView setContentOffset:CGPointMake(round(x), round(y)) animated:animate];
}

@end
