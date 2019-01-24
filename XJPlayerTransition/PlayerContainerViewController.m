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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    /*
    CGFloat PortraitW = MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    CGFloat PortraitH = MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.view.bounds = CGRectMake(0, 0, PortraitW, PortraitH);*/
    //self.view.bounds = [UIScreen mainScreen].bounds;
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
    XJPlayerFullScreenViewController *vc = [[XJPlayerFullScreenViewController alloc] init];
    XJPlayerTransitioningDelegate *transition = vc.transition;
    transition.sourceView = containerView;
    transition.playerView = playerView;
    //transition.sourceGravity = .resizeAspect
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    vc.transitioningDelegate = transition;
    [self presentViewController:vc animated:YES completion:nil];
}


@end
