//
//  XJPlayerAnimatedTransitioning.m
//  XJPlayerTransition
//
//  Created by XJIMI on 2019/1/22.
//  Copyright © 2019 XJIMI. All rights reserved.
//

#import "XJPlayerAnimatedTransitioning.h"

@interface XJPlayerAnimatedTransitioning ()

@property (nonatomic, assign) XJPlayerTransitionType transitionType;

@property (nonatomic, weak) AVPlayerLayer *playerLayer;

@end

@implementation XJPlayerAnimatedTransitioning

+ (instancetype)initWithPlayerTransitionType:(XJPlayerTransitionType)transitionType
{
    XJPlayerAnimatedTransitioning *transitioning = [[XJPlayerAnimatedTransitioning alloc] init];
    transitioning.transitionType = transitionType;
    return transitioning;
}

- (void)presentAnimationWithContextTransitioning:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    if (!(fromView || toView || self.sourceView || self.targetView)) return;

    [fromView layoutIfNeeded];
    [toView layoutIfNeeded];

    UIView *containerView = [transitionContext containerView];
    CGPoint sourceCenter = [self.sourceView.superview convertPoint:self.sourceView.center toView:containerView];

    toView.clipsToBounds = YES;
    toView.bounds = self.sourceView.bounds;
    toView.center = sourceCenter;
    [toView setNeedsLayout];
    [toView layoutIfNeeded];
    [containerView addSubview:toView];

    CGAffineTransform transform = toView.transform;
    UIDeviceOrientation deviceOrientation = [[UIDevice currentDevice] orientation];
    UIDeviceOrientation deviceOrientationLandscape = UIDeviceOrientationIsLandscape(deviceOrientation) ? deviceOrientation : UIDeviceOrientationLandscapeLeft;
    switch (deviceOrientationLandscape) {
        case UIDeviceOrientationLandscapeLeft:
            toView.transform = CGAffineTransformRotate(transform, M_PI_2);
            break;

        case UIDeviceOrientationLandscapeRight:
            toView.transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }

    //self.sourceView.alpha = 0.0f;
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionLayoutSubviews
                     animations:^
    {

        toView.transform = CGAffineTransformIdentity;
        toView.bounds = containerView.bounds;
        toView.center = containerView.center;
        [toView layoutIfNeeded];

    } completion:^(BOOL finished) {

        toView.transform = CGAffineTransformIdentity;
        toView.bounds = containerView.bounds;
        toView.center = containerView.center;
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];

    }];
}

- (void)dismissAnimationWithContextTransitioning:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toViewController.view;
    if (!(fromView || toView || self.sourceView || self.targetView)) return;

    [fromView layoutIfNeeded];
    [toView layoutIfNeeded];

    UIView *containerView = [transitionContext containerView];
    CGRect targetRect = [self.targetView convertRect:self.targetView.bounds toView:containerView];
    [containerView insertSubview:toView belowSubview:fromView];
    
    CGAffineTransform transform = fromView.transform;
    UIDeviceOrientation deviceOrientation = [[UIDevice currentDevice] orientation];
    UIDeviceOrientation deviceOrientationLandscape = UIDeviceOrientationIsLandscape(deviceOrientation) ? deviceOrientation : UIDeviceOrientationLandscapeLeft;
    switch (deviceOrientationLandscape) {
        case UIDeviceOrientationLandscapeLeft:
            //fromView.transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
            
        case UIDeviceOrientationLandscapeRight:
            //fromView.transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }

    
    toView.transform = CGAffineTransformIdentity;
    toView.bounds = containerView.bounds;
    toView.center = containerView.center;
    [toView layoutIfNeeded];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionLayoutSubviews
                     animations:^
     {

         fromView.transform = CGAffineTransformIdentity;
         fromView.bounds = targetRect;
         //fromView.center = self.targetView.center;
         [fromView layoutIfNeeded];


     } completion:^(BOOL finished) {

         [fromView removeFromSuperview];

         [transitionContext completeTransition:!transitionContext.transitionWasCancelled];

     }];
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext
{
    switch (self.transitionType) {
        case XJPlayerTransitionTypePresent:
            [self presentAnimationWithContextTransitioning:transitionContext];
            break;
        case XJPlayerTransitionTypeDismiss:
            [self dismissAnimationWithContextTransitioning:transitionContext];
            break;
    }
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}

@end

