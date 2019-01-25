//
//  PlayerContainerViewController.m
//  XJPlayerTransition
//
//  Created by XJIMI on 2019/1/24.
//  Copyright © 2019 XJIMI. All rights reserved.
//

#import "PlayerContainerViewController.h"
#import "PlayerViewController.h"
#import "XJPlayerFullScreenViewController.h"

@interface PlayerContainerViewController () < PlayerViewControllerDelegate >

@property (nonatomic, strong) PlayerViewController *playerVC;

@end

@implementation PlayerContainerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createPlayerViewController];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    CGRect pframe = self.view.bounds;
    pframe.size.height = roundf(pframe.size.width * (9.0/16.0));
    self.playerVC.view.frame = pframe;
}

- (void)createPlayerViewController
{
    PlayerViewController *vc = [[PlayerViewController alloc] init];
    vc.delegate = self;
    [vc willMoveToParentViewController:self];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    [vc didMoveToParentViewController:self];
    self.playerVC = vc;
}

- (void)fullScreenWithPlayerView:(UIView *)playerView containerView:(UIView *)containerView
{
    __weak typeof(self)weakSelf = self;
    [self setStatusBarHidden:YES statusBarStyle:self.statusBarStyle animation:UIStatusBarAnimationSlide completion:^(BOOL finished) {

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf presentFullScreenWithPlayerView:playerView containerView:containerView];
        });

    }];
}

@end
