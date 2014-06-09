//
//  ARImageViewInsideScrollViewTests.m
//  ARImageViewInsideScrollView
//
//  Created by Daniel Doubrovkine on 6/9/14.
//  Copyright (c) 2014 Artsy. All rights reserved.
//

#import "ARViewController.h"

SpecBegin(ARViewController)

__block ARViewController *vc = nil;

describe(@"remote", ^{
    beforeEach(^{
        UIWindow *window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
        vc = [[ARViewController alloc] init];
        window.rootViewController = vc;
        expect(vc.view).willNot.beNil();
        [window makeKeyAndVisible];
    });
    
    it(@"displays image", ^{
        expect(vc.view).will.haveValidSnapshotNamed(@"default");
    });
});

SpecEnd

