//
//  ARViewController.m
//  ARImageViewInsideScrollView
//
//  Created by Daniel Doubrovkine on 6/1/14.
//  Copyright (c) 2014 Artsy. All rights reserved.
//

#import "ARViewController.h"

@interface ARViewController () <UIScrollViewDelegate>
@property(nonatomic, strong, readonly) UIScrollView *scrollView;
@property(nonatomic, strong, readonly) UIImageView *imageView;
@property(nonatomic, strong, readonly) UIImage *image;
@end

@implementation ARViewController

- (void)viewDidLoad
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    scrollView.delegate = self;
    scrollView.minimumZoomScale = 0.5;
    scrollView.maximumZoomScale = 2;
    _scrollView = scrollView;

    UIImage *image = [UIImage imageNamed:@"boy.jpg"];
    _image = image;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    _imageView = imageView;
    
    [scrollView addSubview:imageView];
    scrollView.contentSize = image.size;
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    [doubleTap setNumberOfTapsRequired:2];
    [self.view addGestureRecognizer:doubleTap];
    
    [self centerOnImage];
}

- (void)centerOnImage
{
    [self centerOnPoint:CGPointMake(self.image.size.width / 2, self.image.size.height / 2) animated:YES];
}

- (void)centerOnPoint:(CGPoint)point animated:(BOOL)animate
{
    CGFloat x = (point.x * self.scrollView.zoomScale) - (self.view.frame.size.width / 2.0f);
    CGFloat y = (point.y * self.scrollView.zoomScale) - (self.view.frame.size.height / 2.0f);
    [self.scrollView setContentOffset:CGPointMake(round(x), round(y)) animated:animate];
}

- (void)handleDoubleTap:(UIGestureRecognizer *)gestureRecognizer
{
    [UIView animateWithDuration:0.3 animations:^{
        [self.scrollView setZoomScale:self.scrollView.zoomScale + 0.1];
    }];
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    self.imageView.frame = CGRectMake(0, 0,
        self.image.size.width * self.scrollView.zoomScale,
        self.image.size.height * self.scrollView.zoomScale);
    self.scrollView.contentSize = self.imageView.frame.size;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

@end
