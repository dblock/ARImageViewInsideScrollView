//
//  ARViewController.m
//  ARImageViewInsideScrollView
//
//  Created by Daniel Doubrovkine on 6/1/14.
//  Copyright (c) 2014 Artsy. All rights reserved.
//

#import "ARViewController.h"

@implementation ARViewController

- (void)viewDidLoad
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];

    UIImage *image = [UIImage imageNamed:@"boy.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [scrollView addSubview:imageView];
    scrollView.contentSize = image.size;
}

@end
