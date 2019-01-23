//
//  XJPlayerFullScreenViewController.m
//  XJPlayerTransition
//
//  Created by XJIMI on 2019/1/22.
//  Copyright © 2019 XJIMI. All rights reserved.
//

#import "XJPlayerFullScreenViewController.h"
#import "ViewController.h"

@interface XJPlayerFullScreenViewController ()

@end

@implementation XJPlayerFullScreenViewController

- (void)dealloc
{
    NSLog(@"%s", __func__);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    //[self.view addSubview:self.playerContainer];
    //self.playerContainer.frame = self.view.bounds;
}

- (XJPlayerTransitioningDelegate *)transition
{
    if (!_transition)
    {
        _transition = [[XJPlayerTransitioningDelegate alloc] init];
        _transition.targetView = self.view;
    }

    return _transition;
}
/*
- (UIView *)playerContainer
{
    if (!_playerContainer) {
        _playerContainer = [[UIView alloc] init];
        _playerContainer.backgroundColor = [UIColor redColor];
    }
    return _playerContainer;
}
*/
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationLandscapeLeft;
}
 

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (BOOL)prefersHomeIndicatorAutoHidden {
    return YES;
}

@end
