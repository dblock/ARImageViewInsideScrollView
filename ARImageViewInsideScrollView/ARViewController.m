//
//  ARViewController.m
//  ARImageViewInsideScrollView
//
//  Created by Daniel Doubrovkine on 6/1/14.
//  Copyright (c) 2014 Artsy. All rights reserved.
//

#import "ARViewController.h"

@interface ARViewController () <UIScrollViewDelegate>
@property (nonatomic, readonly) NSObject<ARTiledImageViewDataSource> *dataSource;
@property(nonatomic, strong, readonly) UIScrollView *scrollView;
@property(nonatomic, strong, readonly) UIImageView *imageView;
@property(nonatomic, strong, readonly) UIImage *image;
@end

@implementation ARViewController

- (void)viewDidLoad
{
    ARLocalTiledImageDataSource *dataSource = [[ARLocalTiledImageDataSource alloc] init];
    _dataSource = dataSource;
    dataSource.tileBasePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Images/boy/tiles"];
    dataSource.maxTiledHeight = 2130;
    dataSource.maxTiledWidth = 1200;
    dataSource.minTileLevel = 9;
    dataSource.maxTileLevel = 12;
    dataSource.tileSize = 512;
    dataSource.tileFormat = @"jpg";
    
    ARTiledImageScrollView *scrollView = [[ARTiledImageScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.dataSource = dataSource;
    scrollView.displayTileBorders = NO;
    scrollView.backgroundImage = [UIImage imageNamed:@"boy.jpg"];
    [self.view addSubview:scrollView];
    _scrollView = scrollView;
    
    [scrollView zoomToFit:YES];
}

@end
