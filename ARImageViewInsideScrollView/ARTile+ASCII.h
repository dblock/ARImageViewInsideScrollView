//
//  ARTile+ASCII.h
//  Artsy
//
//  Created by Daniel Doubrovkine on 4/1/14.
//  Copyright (c) 2014 Artsy. All rights reserved.
//

#import <ARTiledImageView/ARTiledImageView.h>
#import <ARTiledImageView/ARTile.h>

@interface ARTile (ASCII)

+ (BOOL)ascii;
+ (void)setAscii:(BOOL)value;

@end