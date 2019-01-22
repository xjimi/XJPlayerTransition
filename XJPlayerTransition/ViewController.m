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

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *playerView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.view.bounds = [UIScreen mainScreen].bounds;
}

- (IBAction)action_fullscreen:(id)sender
{
    XJPlayerFullScreenViewController *vc = [[XJPlayerFullScreenViewController alloc] init];
    XJPlayerTransitioningDelegate *transition = vc.transition;
    transition.targetView = vc.playerContainer;
    transition.sourceView = self.playerView;
    //transition.sourceGravity = .resizeAspect
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    vc.transitioningDelegate = transition;
    [self presentViewController:vc animated:YES completion:nil];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}




@end
