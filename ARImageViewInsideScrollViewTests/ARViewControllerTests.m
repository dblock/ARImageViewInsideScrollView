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
    
    it(@"displays image", ^AsyncBlock {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, (unsigned long) NULL), ^(void) {
            [NSThread sleepForTimeInterval:2.0];
            expect(vc.view).will.haveValidSnapshotNamed(@"default");
            done();
        });
    });
});

SpecEnd

