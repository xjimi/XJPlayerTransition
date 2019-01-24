//
//  ViewController.m
//  XJPlayerTransition
//
//  Created by XJIMI on 2019/1/22.
//  Copyright © 2019 XJIMI. All rights reserved.
//

#import "ViewController.h"
#import "XJPlayerFullScreenViewController.h"
#import "XJPlayerTransitioningDelegate.h"
#import "VideoTableViewCell.h"

@interface ViewController () < UITableViewDelegate, UITableViewDataSource, VideoTableViewCellDelegate >

@property (weak, nonatomic) IBOutlet UIView *playerView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, assign) BOOL statusBarHidden;
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;
@property (nonatomic, assign) UIStatusBarAnimation statusBarAnimation;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.view.bounds = [UIScreen mainScreen].bounds;
    [self setStatusBarHidden:NO animation:UIStatusBarAnimationFade];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.delegate = self;
    return cell;
}

- (void)fullscreenWithPlayerView:(UIView *)playerView containerView:(UIView *)containerView
{
    __weak typeof(self)weakSelf = self;
    BOOL isInCall = [UIApplication sharedApplication].statusBarFrame.size.height == 40;
    [self setStatusBarHidden:YES statusBarStyle:self.statusBarStyle animation:UIStatusBarAnimationSlide completion:^(BOOL finished) {

        if (!isInCall) {
            [weakSelf presentFullScreenWithPlayerView:playerView containerView:containerView];
        } else {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf presentFullScreenWithPlayerView:playerView containerView:containerView];
            });
        }

    }];
}

- (void)presentFullScreenWithPlayerView:(UIView *)playerView containerView:(UIView *)containerView
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

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}


- (void)setStatusBarHidden:(BOOL)hidden animation:(UIStatusBarAnimation)animation
{
    [self setStatusBarHidden:hidden statusBarStyle:self.statusBarStyle animation:animation completion:nil];
}

- (void)setStatusBarHidden:(BOOL)hidden
            statusBarStyle:(UIStatusBarStyle)statusBarStyle
                 animation:(UIStatusBarAnimation)animation
                completion:(void (^ __nullable)(BOOL finished))completion
{
    self.statusBarStyle = statusBarStyle;
    self.statusBarHidden = hidden;
    self.statusBarAnimation = animation;

    [UIView animateWithDuration:.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self setNeedsStatusBarAppearanceUpdate];
    } completion:completion];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return self.statusBarStyle;
}

- (BOOL)prefersStatusBarHidden
{
    return self.statusBarHidden;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
    return self.statusBarAnimation;
}



@end
